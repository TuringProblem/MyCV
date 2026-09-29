/*
* author: Andrew 09292026 : @14:50
**/ 

#let defaults = (
  accent: rgb("#26428b"),
  font: "New Computer Modern",
  size: 10pt,
  paper: "us-letter",
  margin: (x: 0.5in, y: 0.45in),
)

#let apply-theme(body, accent: none, font: none, size: none, paper: none, margin: none) = {
  set page(paper: paper, margin: margin)
  set text(font: font, size: size, lang: "en")
  set par(justify: false, leading: 0.55em)
  set list(indent: 0.5em, body-indent: 0.5em, spacing: 0.55em, marker: ([•], [‣]))
  show link: set text(fill: accent)

  show heading.where(level: 1): it => block(above: 1.1em, below: 0.7em, {
    set text(size: size * 1.2, weight: "regular", fill: accent)
    smallcaps(it.body)
    v(-0.65em)
    line(length: 100%, stroke: 0.6pt + black)
  })

  body
}
