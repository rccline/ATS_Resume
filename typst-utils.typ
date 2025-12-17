// typst-utils.typ — CORRECTED VERSION

// ---------- Global theme (use as: #show: resume_theme) ----------
#let resume_theme(
  page_margin: 0.75in,
  base_font: "Libertinus Serif",
  base_size: 10.5pt,
  leading: 1.15em,
  doc,
) = {
  set page(margin: page_margin)
  set text(font: base_font, size: base_size)
  set par(leading: leading)
  set heading(numbering: none)
  doc
}

// ---------- Small helpers ----------
#let muted(body) = text(fill: rgb("#555555"))[#body]
#let small(body) = text(size: 9pt)[#body]
#let micro(body) = text(size: 8pt)[#body]

// ---------- Section header ----------
#let rule_thin() = line(length: 100%, stroke: 0.6pt)

#let section(title) = {
  v(10pt)
  text(weight: "bold", size: 11.5pt)[#title]
  v(4pt)
  rule_thin()
  v(6pt)
}

// ---------- Header ----------
#let resume_header(
  name,
  tagline: none,
  email: none,
  phone: none,
  location: none,
  website: none,
  linkedin: none,
  github: none,
) = {
  align(center)[
    #text(size: 22pt, weight: "bold")[#name]
  ]

  if tagline != none {
    align(center)[
      #text(size: 10.5pt, fill: rgb("#333333"))[#tagline]
    ]
  }

  v(6pt)

  let items = (email, phone, location, website, linkedin, github).filter(it => it != none)
  let printed = items.join(" · ")

  if printed != "" {
    align(center)[
      #text(size: 9.5pt, fill: rgb("#333333"))[#printed]
    ]
  }

  v(12pt)
}

// ---------- Resume entry ----------
#let entry(
  title,
  org: none,
  location: none,
  dates: none,
  body: none,
) = {
  grid(columns: (1fr, auto), gutter: 8pt,
    [
      #text(weight: "bold")[#title]#if org != none [ — #org]#if location != none [ (#location)]
    ],
    [
      #if dates != none { align(right)[#muted(dates)] }
    ],
  )

  if body != none {
    v(4pt)
    body
  }

  v(8pt)
}

// ---------- Bullet list ----------
#let bullets(body) = {
  body
}

// ---------- Skills line ----------
#let skills_line(label, items, sep: " · ") = {
  text(weight: "bold")[#label: ]
  items.join(sep)
}

// ---------- Two-column layout ----------
#let two_col(left, right) = {
  grid(columns: (1fr, 0.55fr), gutter: 16pt,
    left,
    right,
  )
}
