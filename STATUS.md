---
mod:        A Certain Series - Creatures and Hair Renew
packageId:  nelim.acertainseriescreaturesandhairrenew
depot:      Rimworld-A-Certain-Series-Creatures-And-Hair-Renew
visibilite: public
detache:    oui
etape:      done
licence:    silent
licence_ou: trois endroits, le mod lui-meme, son About.xml et l'absence de depot lie
vitrine:    complete
teste_le:
workshop:
reste:
  - non_verifie: jamais vu tourner en jeu, et cinq des six reparations ne se lisent qu'en partie
  - non_verifie: un marchand de biens exotiques porte-t-il le fragment de cerveau, sans lequel la machine est inconstructible
  - non_verifie: l'agressivite du scarabee, qui devient manhunter a chaque coup recu, se joue-t-elle bien
session:    local_62b40a02-9527-4bdd-a977-f6bbd6de409d
maj:        2026-09-12, tenue par la session du mod
---

# A Certain Series - Creatures and Hair Renew — etat

Fiche d'etat, lue par une passe sur tous les mods plutot qu'en interrogeant les fils un a un.
Elle vit a la racine, jamais dans `Mod/`, donc Steam ne la recoit pas.

Les champs ci-dessus sont tenus a jour par la session de ce mod. Ce qu'ils disent aujourd'hui :

- **`etape: done`** — le contenu est fait et verifie a froid. 123 defs, aucun C#, les quatre
  controleurs du monorepo rejoues le 2026-09-11 sans une ligne : champs XML valides par
  reflexion contre l'assembly 1.6, references de defs resolues, aucun type tiers non garde,
  200 cles de traduction bonnes.
- **`vitrine: complete`** — `Preview.png` en 896x504 avec le titre grave, `ModIcon.png` en
  128x128, leurs originaux pleine resolution sous `Art/`.
- **`teste_le`, vide** — le mod n'a jamais ete lance. C'est le seul vrai reste, et il n'est pas
  de ceux qu'une session peut faire : voir [`TESTING.md`](TESTING.md), qui liste la partie a
  jouer dans l'ordre, les sept chaines a chercher dans `Player.log`, et les deux questions qui
  n'ont pas de reponse attendue.
- **`workshop`, vide** — jamais envoye. La description Steam ne part qu'a la creation de l'item
  et ne se reimprime jamais : la relire avant de cliquer.
- **`licence: silent`** — l'auteur d'origine, 混沌の味方, n'a declare aucune licence, et le mod
  est mort en 1.0. Verifie dans les trois endroits qui en decident, detaille dans
  [`ATTRIBUTION.md`](ATTRIBUTION.md). Redistribue selon l'usage : credit explicite, lien vers
  l'original, et retrait a la demande.

Vocabulaire de `reste` : `feature` pour une fonctionnalite manquante au premier jet, `defaut`
pour un defaut connu non corrige, `non_verifie` pour ce qui n'a pas pu etre verifie.

Vocabulaire de `licence` : `open` licence explicite, `silent` aucune licence et source morte,
`alive` aucune licence mais source vivante, `forbidden` refus ecrit, `original` rien de repris.
