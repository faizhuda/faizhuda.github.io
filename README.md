# Faiz Naufal Huda — Portfolio Website

Source for [faizhuda.github.io](https://faizhuda.github.io), a single-page portfolio built with
vanilla HTML, CSS, and JavaScript. No framework, no build step, no dependencies — the repository
is deployed to GitHub Pages exactly as it is committed.

---

## Contents

| File | Purpose |
| --- | --- |
| `index.html` | Entire page markup, meta/SEO tags, JSON-LD structured data |
| `style.css` | Design system, layout, responsive rules, reduced-motion overrides |
| `script.js` | Nav drawer, typewriter, scroll reveal, project filters, contact form |
| `cv_faiz_naufal_huda.typ` | CV source (Typst) — the file to edit |
| `cv_faiz_naufal_huda.pdf` | Compiled CV, linked from the site's "View CV" button |
| `robots.txt`, `sitemap.xml` | Crawler directives |

---

## Design

**Obsidian Noir** — a monochrome dark theme.

- Palette driven by CSS custom properties in `:root`: near-black background (`#050505`),
  charcoal cards (`#0d0d0d`), white headings, slate-gray body text.
- Glassmorphism on the navbar and cards (`backdrop-filter: blur()`).
- Fluid type via `clamp()` so headings scale without breakpoints.
- Grayscale profile photo that transitions to full colour on hover.

---

## Features

- **Responsive nav** with a slide-out mobile drawer, animated hamburger, `aria-expanded`
  state, and Escape-to-close.
- **Typewriter effect** cycling role titles in the hero.
- **Scroll reveal** via `IntersectionObserver`, with a fallback that shows everything if the
  API is unavailable.
- **Project filters** (All / ML & Data Science / Full-Stack / DevOps & Cloud) with animated
  card transitions and `aria-pressed` state.
- **Copy-to-clipboard** email using the async Clipboard API, falling back to `execCommand`
  on older browsers.
- **Contact form** posting to [Web3Forms](https://web3forms.com), with a honeypot field.
- **Scroll progress bar** in the navbar.

### Accessibility

Skip-to-content link, `<main>` landmark, visible `:focus-visible` rings, ARIA state on all
interactive controls, and a full `prefers-reduced-motion` block that disables animation while
forcing scroll-revealed content visible.

### Security

GitHub Pages cannot set custom HTTP headers, so the policies that can be expressed in markup
are declared as meta tags in `index.html`:

- **Content-Security-Policy** restricting scripts and styles to same-origin plus Google Fonts,
  and network calls to the Web3Forms endpoint. There are no inline styles or inline scripts,
  so `style-src` and `script-src` need no `'unsafe-inline'`.
- **Referrer-Policy** `strict-origin-when-cross-origin`.
- `rel="noopener noreferrer"` on every external link.

---

## Featured projects

The grid links to the repositories behind each project:

1. **MyToko** — customer + admin e-commerce platform. Placed 2nd at AgritechJam
   (Agriinformatics 2025). Next.js, TypeScript, Supabase, with PostgreSQL stored procedures
   for atomic order cancellation.
2. **AQI Bangladesh** — end-to-end air quality prediction across 30 cities. LightGBM on 1M+
   rows (MAE 1.13, R² 0.9986), 40 unit tests, GitHub Actions CI/CD, Docker.
3. **AgriDesk** — full-stack academic document management system on Clean Architecture, DDD,
   and finite-state document workflows. SHA-256 hashing with QR verification, 118 tests.
4. **LTI Incident Risk Prediction** — BNSP Associate Data Scientist certification project
   classifying Lost Time Injury risk from 2,699 SHE incident records.
5. **Infrastructure Monitoring** — Prometheus, Grafana, and Alertmanager with Telegram
   alerting over a simulated DC-DRC failover environment.
6. **This portfolio.**

---

## Running locally

The site is static, so any static file server works:

```bash
npx serve .
```

Opening `index.html` directly via `file://` also mostly works, but a server is preferable —
the CSP and fetch-based contact form behave as they do in production.

## Rebuilding the CV

The CV is written in [Typst](https://typst.app). After editing `cv_faiz_naufal_huda.typ`,
recompile and commit both files:

```bash
typst compile cv_faiz_naufal_huda.typ cv_faiz_naufal_huda.pdf
```
