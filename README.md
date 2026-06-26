# Faiz Naufal Huda - Professional Portfolio Website

A premium, modern, and highly responsive monochrome (black-and-white) portfolio website styled with the **Obsidian Noir** design system. This site is tailored to showcase academic achievements and technical capability in Computer Science and Data Science/Analytics.

Live site: [faizhuda.github.io](https://faizhuda.github.io)

---

## 🎨 Design Aesthetics & UX

- **Obsidian Noir Theme**: A dark mode-centric palette featuring pure white headings (`#ffffff`), charcoal containers (`#0d0d0d`), and slate-gray body text (`#a3a3a3`) for strong contrast and high readability.
- **Glassmorphism**: Layout elements and floating navbars styled with frosted borders and backdrop blurs (`backdrop-filter: blur(12px)`).
- **Fluid Typography**: Dynamic typography sizing (`clamp()`) to prevent text wrapping or layout jumping across device sizes.
- **Micro-interactions**: Grayscale profile picture filters transitioning to full color and scale on hover, glowing card borders, and smooth-scroll navigation.

---

## 🚀 Key Features

1. **centralized Navigation**: Floating, responsive sticky navbar with mobile slide-out drawer menu and custom hamburger menu transitions.
2. **Typewriter Effect**: An interactive typewriter animation on the landing hero section cycling through primary roles and interests.
3. **Scroll Animations**: Scroll-to-reveal layouts using highly efficient vanilla JS `IntersectionObserver` API with a CSS-based fallback.
4. **Copy-to-Clipboard**: Copy contact email address to clipboard with a custom animated toast notification and clipboard API checks (with fallback support for legacy browsers).
5. **SEO Optimized**: Standard semantic HTML5 tags (`header`, `nav`, `section`, `footer`), crisp inline SVG icons, meta keywords/descriptions, and fast load times.

---

## 📂 Featured Projects

The projects grid highlights core accomplishments:
1. **LTI Incident Risk Prediction (PT Banana Coal)**: A machine learning classification model predicting Lost Time Injury (LTI) incident risks. Compares Logistic Regression, Random Forest, and XGBoost. *(Associate Data Scientist BNSP LSP Certification)*.
2. **AQI Bangladesh Prediction**: Real-time Air Quality Index prediction using LightGBM. Includes winsorization, automated `pytest` test suites, CI/CD with GitHub Actions, and Docker compose support.
3. **Agridesk Backend API**: FastAPI backend implementing Domain-Driven Design (DDD) and Clean Architecture principles. Features secure PDF signature stamping, cryptographic SHA-256 document hashing for anti-tampering, and 100% test coverage.
4. **Infrastructure Monitoring System**: Centralized observability stack monitoring a DC-DRC virtualized server environment. Integrates Prometheus scraping, Grafana 12 panels, Alertmanager Telegram bot rules, and Cloudflare Tunnel routing.

---

## 🛠️ Tech Stack

- **Structure**: Semantic HTML5
- **Styling**: Vanilla CSS3 (Custom Variables, Flexbox, Grid)
- **Scripting**: Vanilla JavaScript (ES6+)
- **Typography**: Google Fonts (*Outfit* for headings, *Inter* for body)

---

## 💻 How to Run Locally

Since this is a static site, you don't need any complex compiler or runtime environment:
1. Clone the repository:
   ```bash
   git clone https://github.com/faizhuda/faizhuda.github.io.git
   ```
2. Open `index.html` in any modern web browser.
