// ── Helpers ─────────────────────────────────────────────────────────────────
// #include creates an isolated module scope in Typst, so these must live here
// rather than in the entry file — the entry file's bindings aren't visible here.

// sticky: true keeps a section heading glued to the entry that follows it, so a
// heading can never be left stranded alone at the bottom of a page.
#let section(title) = {
  v(7pt)
  block(sticky: true)[
    #text(size: 11pt, weight: "bold")[#title]
    #v(-3pt)
    #line(length: 100%, stroke: 0.5pt)
  ]
  v(4pt)
}

#let row(lhs, rhs) = grid(
  columns: (1fr, auto),
  align: (top + left, top + right),
  column-gutter: 6pt,
  lhs,
  rhs,
)

// ── Summary ─────────────────────────────────────────────────────────────────

#section("Summary")
Computer Science undergraduate at IPB University (GPA: 3.85/4.00) with hands-on experience
building complete, well-tested systems end-to-end, from a full-stack academic document management
system (118 tests, Clean Architecture) to an award-winning hackathon e-commerce platform and
ML pipelines with CI/CD, Docker, and transformer fine-tuning. Completed the
Pijak × IBM SkillsBuild AI Engineer Cohort as a selected participant, graduating as Top Graduate. Fluent in English (TOEFL ITP 607).
Actively seeking a software engineering or ML engineering internship.

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

// ── Projects ────────────────────────────────────────────────────────────────
// Placed above Experience: for SWE/ML roles these are the strongest evidence,
// and they need to land on page one where recruiters actually look.

#section("Projects")

#row(
  [*AQI Bangladesh: Air Quality Prediction* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/aqi-bangladesh-prediction")[github.com/faizhuda/aqi-bangladesh-prediction])]],
  [Apr -- Jun 2026],
)
#v(2pt)
- Independently built an end-to-end ML system predicting AQI across 30 cities in Bangladesh; trained LightGBM on 1M+ rows of multi-pollutant sensor data achieving MAE = 1.13, RMSE = 1.77, R² = 0.9986; chosen over XGBoost for 3--10× faster training on large-scale tabular data.
- Engineered modular pipeline with centralized YAML config, lag features, rolling windows, cyclical time encoding, and walk-forward cross-validation (3-fold) for time-aware evaluation; experiment tracking via CSV logging.
- Implemented 40 unit tests across 6 modules (pytest + coverage); CI/CD via GitHub Actions with black/flake8 enforcement and pre-commit hooks; containerized with Docker for reproducible deployment.

#v(3pt)
#row(
  [*AgriDesk: Academic Document Management System* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/ads-agridesk")[github.com/faizhuda/ads-agridesk])]],
  [Jan -- Jun 2026],
)
#v(2pt)
- Led full-stack development of a 4-person team project; solely responsible for the complete local implementation: backend in FastAPI + SQLAlchemy 2.0 + Alembic on PostgreSQL and frontend in React 18 + Vite + TailwindCSS v4, built on Clean Architecture, Domain-Driven Design (DDD), and Finite State Machine document workflows with drag-and-drop PDF upload.
- Implemented SHA-256 document hashing with QR code verification enabling third-party authentication without system login; PDF generation (ReportLab + PyPDF) with coordinate-based digital signature stamping.
- Achieved 100% test coverage on core services across 118 passing tests; JWT + bcrypt authentication; in-memory SQLite for isolated unit testing.

#v(3pt)
#row(
  [*Fruit & Vegetable Freshness Classification* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/produce-freshness-classifier")[github.com/faizhuda/produce-freshness-classifier])]],
  [May -- Jun 2026],
)
#v(2pt)
- Independently designed and executed 11 experiment scenarios comparing classical ML (SVM, Random Forest) against a MobileNetV2 CNN for binary fresh/rotten produce classification across 4,391 test images; best CNN scenario reached 98.70% accuracy, a statistically significant improvement over the best classical model (87.34% via SVM, p < 0.001).
- Used paired significance testing to catch a counterintuitive result: a CNN on raw unprocessed images significantly outperformed the same CNN behind a full image-restoration and segmentation pipeline (98.70% vs. 97.22%, p < 0.001).
- Built with 66 pytest unit tests, GitHub Actions CI, and ruff linting; pipeline logic kept side-effect-free and decoupled from Kaggle-specific orchestration for reproducibility.

#v(3pt)
#row(
  [*Loan Approval Prediction: Kaggle Competition* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/loan-approval-prediction")[github.com/faizhuda/loan-approval-prediction])]],
  [Jun 2026],
)
#v(2pt)
- Built an Optuna-tuned ensemble (LightGBM + XGBoost + CatBoost, 135 total trials) for a binary loan-default Kaggle competition, rank-blending the three models to 0.9325 out-of-fold AUC (StratifiedKFold, 5-fold).
- Iterated on feature engineering empirically rather than by intuition: reverted class weighting and most derived features after measuring they reduced OOF AUC, keeping only the one interaction term that measurably helped.

#v(3pt)
#row(
  [*AgritechJam, Agriinformatics 2025 (MyToko)* #h(6pt) #text(size: 9pt)[(#link("https://github.com/faizhuda/agritechjam-mytoko")[github.com/faizhuda/agritechjam-mytoko])]],
  [Oct -- Nov 2025],
)
#v(2pt)
- *Placed 2nd* as full-stack developer in a 3-person team; built a complete customer + admin e-commerce platform using Next.js, TypeScript, Tailwind CSS, and Supabase (PostgreSQL) within hackathon timeframe.
- Implemented PostgreSQL stored procedures for atomic order cancellation with inventory rollback, eliminating race conditions on concurrent stock updates.
- Delivered real-time admin analytics dashboard (Recharts), PDF invoice generation, and full order lifecycle management (Pending → Paid → Shipped → Delivered).

// ── Experience ──────────────────────────────────────────────────────────────

#section("Experience")

#row(
  [*AI Engineer Cohort (Top Graduate)* #linebreak() Pijak × IBM SkillsBuild (Dicoding Indonesia)],
  [Feb -- Jul 2026],
)
#v(2pt)
- Completed structured learning path covering Python, supervised/unsupervised ML, deep learning (CNN & RNN), experiment tracking (MLflow), and production ML deployment via IBM SkillsBuild and Dicoding's industry curriculum.
- Built *PriorMail* as capstone (scored 98/100): an email intelligence system with DistilBERT fine-tuning for 4-class priority classification; designed phishing detection module with security-focused adversarial evaluation protocol.
- Graduated Lulus Penuh (Full Pass) and recognized as Top Graduate ("Lulus Terbaik") of the cohort.

#v(3pt)
#row(
  [*Head of Entrepreneurship & Consumption Committee* #linebreak() IT TODAY, HIMALKOM IPB University],
  [Feb -- Dec 2025],
)
#v(2pt)
- Managed IDR 33 million F&B consumption budget covering meals, snacks, and catering for 500+ participants and 90+ committee members across the full IT TODAY event series.
- Secured IDR 5 million in internal operational funding through entrepreneurial methods to support committee activities.

#v(3pt)
#row(
  [*Treasurer, Welfare & Internal Harmony Division* #linebreak() HIMALKOM IPB University],
  [Jan 2025 -- Dec 2025],
)
#v(2pt)
- Managed annual divisional budget of \~IDR 15--20 million across 2--3 major programs, achieving 100% budget absorption with zero deficit, reflecting accurate planning and real-time expenditure tracking.
- Oversaw 20--30 financial transactions per program cycle; handled reimbursements and documentation with full accountability and transparent reporting.

#v(3pt)
#row(
  [*Teaching Volunteer, Ilkomerz Mengajar* #linebreak() LPK Tepi Sawah, HIMALKOM IPB University],
  [Feb 2025 -- Nov 2025],
)
#v(2pt)
- Completed 90 volunteer teaching hours (Grade A, 94.96/100) across 14 sessions to 25+ children in Leuwiliang, Bogor over 9 months, covering literacy, English, mathematics, environmental awareness, and introductory programming through game-based activities.

// ── Education ───────────────────────────────────────────────────────────────

#section("Education")
#row(
  [*IPB University* #linebreak() Bachelor of Computer Science #linebreak() GPA: 3.85 / 4.00],
  [Jul 2023 -- Oct 2027 (Expected)],
)

// ── Certifications ───────────────────────────────────────────────────────────

#section("Certifications")
- *AI Engineer Cohort (Top Graduate)*, IBM SkillsBuild + Dicoding Indonesia #h(1fr) Feb -- Jul 2026
- *Associate Data Scientist*, BNSP (Badan Nasional Sertifikasi Profesi) #h(1fr) Jul 2026
- *Belajar Fundamental Deep Learning* (Deep Learning Fundamentals), Dicoding Indonesia #h(1fr) May 2026
- *Belajar Machine Learning untuk Pemula* (ML for Beginners), Dicoding Indonesia #h(1fr) Mar 2026
- *Python for Data Science and ML Essential Training (Part 1 & 2)*, LinkedIn Learning #h(1fr) Feb 2026
- *TOEFL ITP*, ETS (Score: 607) #h(1fr) Nov 2023
