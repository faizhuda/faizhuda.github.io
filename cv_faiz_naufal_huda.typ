#set page(paper: "a4", margin: (x: 0.55in, y: 0.45in))
#set text(font: "New Computer Modern", size: 9.8pt)
#set par(leading: 0.5em, justify: false)
#show link: set text(fill: black)
#set list(indent: 0.5em, body-indent: 0.8em)

// Layout helpers (section, row) live in cv_body.typ — #include creates an
// isolated module scope, so they must be defined there, not here.

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

// Body (Summary through Certifications) lives in cv_body.typ, shared with the
// private variant (cv_faiz_naufal_huda_private.typ) so the two can never drift
// out of sync — only the header above differs between them.
#include "cv_body.typ"
