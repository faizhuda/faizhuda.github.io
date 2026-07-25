#set page(paper: "a4", margin: (x: 0.7in, y: 0.7in))
#set text(font: "New Computer Modern", size: 10pt)
#set par(leading: 0.55em, justify: false)
#show link: set text(fill: black)
#set list(indent: 0.5em, body-indent: 0.8em)

// ── Helpers ─────────────────────────────────────────────────────────────────

#let section(title) = {
  v(7pt)
  text(size: 11pt, weight: "bold")[#title]
  v(-3pt)
  line(length: 100%, stroke: 0.5pt)
  v(4pt)
}

#let row(lhs, rhs) = grid(
  columns: (1fr, auto),
  align: (top + left, top + right),
  column-gutter: 6pt,
  lhs,
  rhs,
)

// ── Header ──────────────────────────────────────────────────────────────────

#align(center)[
  #text(size: 20pt, weight: "bold")[Faiz Naufal Huda] #linebreak()
  #v(1pt)
  Bogor, Indonesia #linebreak()
  #v(1pt)
  #link("mailto:faiznaufal2015@gmail.com")[faiznaufal2015\@gmail.com]
  #h(5pt)·#h(5pt)
  #link("https://linkedin.com/in/faizhuda")[linkedin.com/in/faizhuda]
  #h(5pt)·#h(5pt)
  #link("https://github.com/faizhuda")[github.com/faizhuda]
  #h(5pt)·#h(5pt)
  #link("https://faizhuda.github.io")[faizhuda.github.io]
]

#v(-4pt)

// ── Summary ─────────────────────────────────────────────────────────────────

#section("Summary")
Computer Science undergraduate at IPB University (GPA: 3.85/4.00) with hands-on experience
building complete, well-tested systems end-to-end, from a full-stack academic document management
system (118 tests, Clean Architecture) to an award-winning hackathon e-commerce platform and
ML pipelines with CI/CD, Docker, and transformer fine-tuning. Selected participant in the
Pijak × IBM SkillsBuild AI Engineer Cohort. Fluent in English (TOEFL ITP 607).

// ── Technical Skills ────────────────────────────────────────────────────────

#section("Technical Skills")
#grid(
  columns: (auto, 1fr),
  column-gutter: 6pt,
  row-gutter: 2pt,
  [*Languages:*],       [Python, JavaScript, TypeScript, SQL],
  [*Frontend:*],        [React 18, Tailwind CSS, Vite],
  [*Backend & DB:*],    [FastAPI, SQLAlchemy 2.0, PostgreSQL, JWT + bcrypt, Alembic],
  [*ML / Data:*],       [LightGBM, XGBoost, Scikit-learn, Pandas, NumPy],
  [*DevOps / Tools:*],  [Docker, GitHub Actions (CI/CD), Git, pytest],
  [*Familiar:*],        [Next.js, Supabase, PyTorch, Hugging Face Transformers, TensorFlow/Keras, MLflow, Prometheus, Grafana, Weights & Biases, Bash, ReportLab, PyPDF],
)

// ── Experience ──────────────────────────────────────────────────────────────

#section("Experience")

#row(
  [*AI Engineer Cohort (Selected Participant)* #linebreak() Pijak × IBM SkillsBuild (Dicoding Indonesia)],
  [Jan 2026 -- Present],
)
#v(2pt)
- Completed structured learning path covering Python, supervised/unsupervised ML, deep learning (CNN & RNN), experiment tracking (MLflow), and production ML deployment via IBM SkillsBuild and Dicoding's industry curriculum.
- Built *PriorMail* as capstone: an email intelligence system with DistilBERT fine-tuning for 4-class priority classification; designed phishing detection module with security-focused adversarial evaluation protocol.
- Earned dual certificates from IBM SkillsBuild and Dicoding upon module completion.

#v(5pt)
#row(
  [*Treasurer, Welfare & Internal Harmony Division* #linebreak() HIMALKOM IPB University],
  [Jan 2025 -- Dec 2025],
)
#v(2pt)
- Managed annual divisional budget of \~IDR 15--20 million across 2--3 major programs, achieving 100% budget absorption with zero deficit, reflecting accurate planning and real-time expenditure tracking.
- Oversaw 20--30 financial transactions per program cycle; handled reimbursements and documentation with full accountability and transparent reporting.

#v(5pt)
#row(
  [*Head of Funding & Consumption Division* #linebreak() IT TODAY, HIMALKOM IPB University],
  [Apr 2025 -- Dec 2025],
)
#v(2pt)
- Managed IDR 33 million F&B consumption budget covering meals, snacks, and catering for 500+ participants and 90+ committee members across the full IT TODAY event series.
- Secured IDR 5 million in internal operational funding through entrepreneurial methods to support division activities.

#v(5pt)
#row(
  [*Teaching Volunteer* #linebreak() LPK Tepi Sawah, HIMALKOM IPB University],
  [Feb 2025 -- Nov 2025],
)
#v(2pt)
- Delivered 14 teaching sessions to 25+ children in Leuwiliang, Bogor over 9 months, covering literacy, English, mathematics, environmental awareness, and introductory programming through game-based activities.
- Served a dual role: committee organizer (coordination, logistics) and on-site volunteer (direct teaching and mentoring).

// ── Projects ────────────────────────────────────────────────────────────────

#section("Projects")

#row(
  [*AQI Bangladesh: Air Quality Prediction* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/daming-kelompok-7")[github.com/faizhuda/daming-kelompok-7])]],
  [Apr -- Jun 2026],
)
#v(2pt)
- Independently built an end-to-end ML system predicting AQI across 30 cities in Bangladesh; trained LightGBM on 1M+ rows of multi-pollutant sensor data achieving MAE = 1.13, RMSE = 1.77, R² = 0.9986; chosen over XGBoost for 3--10× faster training on large-scale tabular data.
- Engineered modular pipeline with centralized YAML config, lag features, rolling windows, cyclical time encoding, and walk-forward cross-validation (3-fold) for time-aware evaluation; experiment tracking via CSV logging.
- Implemented 40 unit tests across 6 modules (pytest + coverage); CI/CD via GitHub Actions with black/flake8 enforcement and pre-commit hooks; containerized with Docker for reproducible deployment.

#v(5pt)
#row(
  [*AgritechJam, Agriinformatics 2025 (MyToko)* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/agritechjam-mytoko")[github.com/faizhuda/agritechjam-mytoko])]],
  [Oct -- Nov 2025],
)
#v(2pt)
- *Placed 2nd* as full-stack developer in a 3-person team; built a complete customer + admin e-commerce platform using Next.js, TypeScript, Tailwind CSS, and Supabase (PostgreSQL) within hackathon timeframe.
- Implemented PostgreSQL stored procedures for atomic order cancellation with inventory rollback, eliminating race conditions on concurrent stock updates.
- Delivered real-time admin analytics dashboard (Recharts), PDF invoice generation, and full order lifecycle management (Pending → Paid → Shipped → Delivered).

#v(5pt)
#row(
  [*AgriDesk: Academic Document Management System* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/ads-agridesk")[github.com/faizhuda/ads-agridesk])]],
  [Jan -- Jun 2026],
)
#v(2pt)
- Led full-stack development of a 4-person team project; solely responsible for the complete local implementation: backend in FastAPI + SQLAlchemy 2.0 + Alembic on PostgreSQL and frontend in React 18 + Vite + TailwindCSS v4, built on Clean Architecture, Domain-Driven Design (DDD), and Finite State Machine document workflows with drag-and-drop PDF upload.
- Implemented SHA-256 document hashing with QR code verification enabling third-party authentication without system login; PDF generation (ReportLab + PyPDF) with coordinate-based digital signature stamping.
- Achieved 100% test coverage on core services across 118 passing tests; JWT + bcrypt authentication; in-memory SQLite for isolated unit testing.

// ── Education ───────────────────────────────────────────────────────────────

#section("Education")
#row(
  [*IPB University* #linebreak() Bachelor of Computer Science #linebreak() GPA: 3.85 / 4.00],
  [Jul 2023 -- Oct 2027 (Expected)],
)

// ── Certifications ───────────────────────────────────────────────────────────

#section("Certifications")
- *AI Engineer Cohort*, IBM SkillsBuild + Dicoding Indonesia #h(1fr) Jan 2026 -- Present
- *Associate Data Scientist*, BNSP (Badan Nasional Sertifikasi Profesi) #h(1fr) Jun 2026
- *Belajar Fundamental Deep Learning*, Dicoding Indonesia #h(1fr) May 2026
- *Belajar Machine Learning untuk Pemula*, Dicoding Indonesia #h(1fr) Mar 2026
- *Python for Data Science and ML Essential Training (Part 1 & 2)*, LinkedIn Learning #h(1fr) Feb 2026
- *TOEFL ITP*, ETS (Score: 607) #h(1fr) Nov 2023
