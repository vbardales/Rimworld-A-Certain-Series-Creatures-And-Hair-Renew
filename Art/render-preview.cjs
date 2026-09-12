// Requires playwright and sharp; node Art/render-preview.cjs
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright'),sharp=require('sharp');
const root=path.resolve(__dirname,'..'),palette=JSON.parse(fs.readFileSync(path.join(__dirname,'preview-palette.json'),'utf8').replace(/^\uFEFF/,''));
const lum=rgb=>rgb.map(v=>{v/=255;return v<=.04045?v/12.92:((v+.055)/1.055)**2.4}).reduce((s,v,i)=>s+v*[.2126,.7152,.0722][i],0);
const rgb=h=>h.match(/\w\w/g).map(x=>parseInt(x,16)),contrast=(a,b)=>(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
(async()=>{
const server=http.createServer((req,res)=>{const file=path.resolve(root,'.'+decodeURIComponent(req.url.split('?')[0]));if(!file.startsWith(root+path.sep)){res.writeHead(403).end();return;}fs.readFile(file,(e,d)=>{if(e){res.writeHead(404).end();return;}res.setHeader('Content-Type',({'.html':'text/html','.json':'application/json','.png':'image/png','.xml':'text/xml'})[path.extname(file)]||'text/plain');res.end(d);});});
await new Promise(r=>server.listen(0,'127.0.0.1',r));let browser;
try{
browser=await chromium.launch({executablePath:process.env.CHROME_PATH||'C:/Program Files/Google/Chrome/Application/chrome.exe',headless:true});
const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
await page.goto(`http://127.0.0.1:${server.address().port}/Art/Preview-text.html`);await page.evaluate(()=>window.previewReady);
const client=await page.context().newCDPSession(page);await client.send('DOM.enable');await client.send('CSS.enable');const {root:dom}=await client.send('DOM.getDocument');const metrics={};
for(const selector of ['h1','.connector','.suffix','.tag','p','.version']){const {nodeId}=await client.send('DOM.querySelector',{nodeId:dom.nodeId,selector});const {fonts}=await client.send('CSS.getPlatformFontsForNode',{nodeId});if(!fonts.length||fonts.some(f=>!/^Segoe UI( Semibold| Bold)?$/.test(f.familyName)))throw Error('Font fallback '+JSON.stringify(fonts));metrics[selector]={fonts,rect:await page.locator(selector).boundingBox()};}
const output=path.join(root,'Mod/About/Preview.png'),rendered=await page.screenshot();await sharp(rendered).png({compressionLevel:9}).toFile(output);await sharp(rendered).resize(268).png().toFile(path.join(__dirname,'preview-268.png'));
await page.addStyleTag({content:'.text,.version{visibility:hidden}'});const background=await page.screenshot();const {data,info}=await sharp(background).removeAlpha().raw().toBuffer({resolveWithObject:true});
for(const selector of ['h1','.connector','.suffix','.tag','p']){const {x,y,width,height}=metrics[selector].rect;let min=Infinity;for(let py=Math.floor(y);py<Math.ceil(y+height);py++)for(let px=Math.floor(x);px<Math.ceil(x+width);px++){const i=(py*info.width+px)*3;min=Math.min(min,contrast(lum(rgb(['.tag','.suffix'].includes(selector)?palette.inkSecondary:palette.inkPrimary)),lum([...data.subarray(i,i+3)])));}metrics[selector].minimumContrast=min;if(min<4.5)throw Error(selector+' contrast '+min);}
metrics['.version'].minimumContrast=contrast(lum(rgb(palette.accent)),lum(rgb(palette.badgeInk)));if(metrics['.version'].minimumContrast<4.5)throw Error('Badge contrast');metrics.bytes=fs.statSync(output).size;if(metrics.bytes>=900000)throw Error('Too large');fs.writeFileSync(path.join(__dirname,'preview-qa.json'),JSON.stringify(metrics,null,2)+'\n');console.log(JSON.stringify(metrics,null,2));
}finally{if(browser)await browser.close();server.close();}
})().catch(e=>{console.error(e);process.exitCode=1});

