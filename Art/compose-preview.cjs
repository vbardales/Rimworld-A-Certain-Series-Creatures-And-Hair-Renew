// Adds the cut-out ModIcon to the delivered Preview.png, tilted in the corner the text block leaves free.
// Run after render-preview.cjs (which writes Mod/About/Preview.png from Art/Preview-text.html).
// Requires sharp. node Art/compose-preview.cjs
const path = require('path');
const sharp = require('sharp');

const root = path.resolve(__dirname, '..');
const iconSource = path.join(root, 'Art/ModIcon-source.png');
const previewPath = path.join(root, 'Mod/About/Preview.png');

// This mod's illustration fills the right half (fairy figure + version badge top-right); the bottom-right
// corner is the free one, not bottom-left (the beetle occupies the bottom-left floor). Icon there,
// rotated -15° (STYLE_RIMWORLD.md, "Le ModIcon détouré sur la vitrine" — left corner +15°, right corner -15°).
const CORNER = 'bottom-right';
const ROTATION = -15;
const SIDE_BEFORE_ROTATION = 150; // px, square, before rotation grows the canvas
const MARGIN_BOTTOM = 0; // px from the bottom edge — icon bleeds to the frame edge
const MARGIN_SIDE = 0; // px from the right edge — icon bleeds to the frame edge ("comme si le modIcon sortait du coin")

async function cutOut(buffer) {
  const { data, info } = await sharp(buffer).ensureAlpha().raw().toBuffer({ resolveWithObject: true });
  const { width, height, channels } = info;
  // Sample the background colour from a corner pixel: a model-generated ModIcon arrives on a near-black flat fill.
  const bg = [data[0], data[1], data[2]];
  const LOW = 24, HIGH = 48; // colour-distance thresholds: below LOW fully transparent, above HIGH fully opaque, feather between
  for (let i = 0; i < data.length; i += channels) {
    const dist = Math.sqrt((data[i] - bg[0]) ** 2 + (data[i + 1] - bg[1]) ** 2 + (data[i + 2] - bg[2]) ** 2);
    const alpha = dist <= LOW ? 0 : dist >= HIGH ? 255 : Math.round(((dist - LOW) / (HIGH - LOW)) * 255);
    data[i + 3] = Math.min(data[i + 3], alpha);
  }
  return sharp(data, { raw: { width, height, channels } }).png().toBuffer();
}

(async () => {
  const cut = await cutOut(await sharp(iconSource).toBuffer());
  const square = await sharp(cut).resize(SIDE_BEFORE_ROTATION, SIDE_BEFORE_ROTATION, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } }).toBuffer();
  const rotatedRaw = await sharp(square).rotate(ROTATION, { background: { r: 0, g: 0, b: 0, alpha: 0 } }).toBuffer();
  const rotated = await sharp(rotatedRaw).trim().toBuffer(); // rotation adds transparent corners; trim so the visible icon reaches the frame edge, not its alpha padding
  const rotatedMeta = await sharp(rotated).metadata();

  const preview = sharp(previewPath);
  const { width: pw, height: ph } = await preview.metadata();
  const left = pw - MARGIN_SIDE - rotatedMeta.width;
  const top = ph - MARGIN_BOTTOM - rotatedMeta.height;
  if (CORNER !== 'bottom-right') throw new Error(`compose-preview.cjs is written for this mod's layout (bottom-right); update it before reusing for another corner`);
  if (left < 0 || top < 0 || left + rotatedMeta.width > pw || top + rotatedMeta.height > ph) throw new Error('the rotated icon does not fit inside the frame at this margin');

  await preview.composite([{ input: rotated, left, top }]).png({ compressionLevel: 9 }).toFile(previewPath + '.tmp');
  const fs = require('fs');
  fs.renameSync(previewPath + '.tmp', previewPath);
  console.log(`ModIcon composed at (${left},${top}), ${rotatedMeta.width}x${rotatedMeta.height} after +${ROTATION}° rotation, into ${path.relative(root, previewPath)}`);
})().catch((e) => { console.error(e); process.exitCode = 1; });
