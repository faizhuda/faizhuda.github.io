// Shared one-page body for public and private CV variants.
#let section(title) = {
  v(4.5pt)
  block(sticky: true)[
    #text(size: 10.3pt, weight: "bold")[#title]
    #v(-3.2pt)
    #line(length: 100%, stroke: 0.45pt)
  ]
  v(2.5pt)
}

#let row(lhs, rhs) = grid(
  columns: (1fr, auto),
  align: (top + left, top + right),
  column-gutter: 7pt,
  lhs,
  rhs,
)

#let project(title, url, date, contribution, evidence) = {
  row(
    [*#title* #h(4pt) #text(size: 8.2pt)[#link(url)[repository]]],
    [#text(size: 8.5pt)[#date]],
  )
  v(0.5pt)
  [• #contribution #linebreak()]
  [• #evidence]
  v(2.2pt)
}

#section("Summary")
Computer Science undergraduate at IPB University (GPA 3.85/4.00; expected October 2027) and BNSP-certified
Associate Data Scientist. Builds reproducible ML systems with appropriate validation, automated tests, CI, and
documented public repositories. Seeking a Data Science or ML Engineering internship.

#section("Technical Skills")
#grid(
  columns: (auto, 1fr),
  column-gutter: 6pt,
  row-gutter: 1.5pt,
  [*ML / Data:*], [Python, SQL, Pandas, NumPy, Scikit-learn, LightGBM, PyTorch, SciPy],
  [*Engineering:*], [FastAPI, React, PostgreSQL, SQLAlchemy, Docker, GitHub Actions, pytest, Git],
  [*Working knowledge:*], [XGBoost, Hugging Face Transformers, Next.js, Supabase, MLflow],
)

#section("Selected Projects")
#project(
  "AQI Bangladesh Prediction",
  "https://github.com/faizhuda/aqi-bangladesh-prediction",
  "May–Jun 2026",
  [Built with a four-person course team; primary repository contributor (27 of 29 commits).],
  [Project trained LightGBM on 1M+ rows across 30 cities; MAE 1.13, RMSE 1.77, R² 0.9986 using three-fold walk-forward validation. Implemented lag/rolling features, 40 tests, CI, and Docker.],
)

#project(
  "Produce Freshness Classification",
  "https://github.com/faizhuda/produce-freshness-classifier",
  "May–Jun 2026",
  [Built with a five-person course team; primary repository contributor (64 of 86 commits).],
  [Compared classical ML and MobileNetV2 across 11 controlled scenarios and 4,391 test images. Best accuracy: 98.70%; paired significance result p < 0.001; 66 tests with CI.],
)

#project(
  "AgriDesk — Academic Document Management",
  "https://github.com/faizhuda/ads-agridesk",
  "Feb–Jun 2026",
  [Led full-stack implementation in a four-person team (36 of 69 repository commits).],
  [Built React/FastAPI/PostgreSQL workflows with SHA-256 hashing, QR verification, and coordinate-based PDF signature stamping. Delivered 118 tests and 100% coverage on core services.],
)

#section("Experience")
#row(
  [*AI Engineer Cohort — Top Graduate* · Pijak × IBM SkillsBuild / Dicoding],
  [Feb–Jul 2026],
)
#v(0.5pt)
• Completed the cohort with full-pass status and Top Graduate recognition. #linebreak()
• Built PriorMail capstone (98/100): fine-tuned DistilBERT for four-class email-priority classification and evaluated phishing detection against adversarial cases.

#v(2.5pt)
#row(
  [*Head of Entrepreneurship & Consumption Committee* · IT TODAY, HIMALKOM IPB],
  [Feb–Dec 2025],
)
#v(0.5pt)
• Managed an IDR 33 million F&B budget for 500+ participants and 90+ committee members; secured IDR 5 million in internal operating funds.

#section("Education & Credentials")
#grid(
  columns: (1.08fr, 0.92fr),
  column-gutter: 14pt,
  [
    *IPB University* #linebreak()
    Bachelor of Computer Science · GPA 3.85/4.00 #linebreak()
    Jul 2023–Oct 2027 (expected)
  ],
  [
    *BNSP Associate Data Scientist* · 2026 #linebreak()
    *IBM SkillsBuild AI Cohort, Top Graduate* · 2026 #linebreak()
    *TOEFL ITP 607* · 2023
  ],
)

#section("Award")
*2nd Place, AgritechJam — Agriinformatics 2025:* MyToko e-commerce platform, built in a three-person team; primary repository contributor (95 of 96 commits). #link("https://github.com/faizhuda/agritechjam-mytoko")[repository]
