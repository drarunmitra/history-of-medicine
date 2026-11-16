# History of Medicine and Public Health

Four lectures for MBBS Community Medicine (Dr. Arun Mitra Peddireddy, AIIMS Bibinagar).

Published at https://drarunmitra.github.io/history-of-medicine/

| Folder / file | What it is |
|---|---|
| `HoM_L1.qmd` to `HoM_L4.qmd` | Quarto Reveal.js sources (HTML slides) |
| `typst/` | Typst (touying, metropolis theme) sources, generated from the `.qmd` files |
| `docs/` | The published site: HTML decks, Typst PDFs, earlier Beamer PDFs |
| `guides/` | Facilitator guides (Markdown sources); built HTML and PDF are in `docs/guides/` |
| `notes/gap_facts.md` | Facts added in the November 2026 review, with items marked **[verify]** |

## Rebuild
```
quarto render HoM_L1.qmd            # repeat for L2 to L4, then move the .html into docs/
python tools/qmd2typ.py HoM_L1.qmd typst/HoM_L1.typ
quarto typst compile --root . typst/HoM_L1.typ docs/HoM_L1_typst.pdf
```
Edit the `.qmd` files only. The Typst files are generated.

## Status
Teaching draft. Facts marked [verify] in `notes/gap_facts.md` are not yet checked against primary sources.
Image credits for the newer images are in `images/L1_new/CREDITS.md` and `images/L3_new/CREDITS.md`. Some older images need their source and licence confirmed.
