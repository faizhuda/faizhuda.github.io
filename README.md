# Faiz Naufal Huda — Portfolio

Source for [faizhuda.github.io](https://faizhuda.github.io), a concise portfolio for Data Science and ML Engineering internship applications.

The page is intentionally static: semantic HTML, one CSS file, no client-side JavaScript, no external fonts, no analytics, and no contact-form service.

## Content principles

- Lead with verifiable outcomes, not self-ratings or slogans.
- Show three relevant projects instead of a large project wall.
- Separate team results from individual contribution.
- Link every featured project to its public repository.
- Keep the CV to one ATS-readable A4 page.

## Files

- `index.html` — page content, SEO metadata, Open Graph metadata, and JSON-LD.
- `style.css` — responsive visual system and accessibility states.
- `image/` — profile sources, responsive AVIF/WebP variants, favicon, and social preview.
- `cv_faiz_naufal_huda.typ` and `cv_body.typ` — Typst CV source.
- `cv_faiz_naufal_huda.pdf` — compiled one-page CV.
- `robots.txt` and `sitemap.xml` — crawler configuration.

## Run locally

```bash
npx serve .
```

## Rebuild the CV

```bash
typst compile cv_faiz_naufal_huda.typ cv_faiz_naufal_huda.pdf
```

## Validation

```bash
npx html-validate index.html
git diff --check -- '*.html' '*.css' '*.typ' '*.md' '*.xml'
```

GitHub Pages deploys the repository root directly.
