/*
* author: Andrew 09292026 : @15:12
**/ 
#import "utils.typ": dates, opt, pretty-url, ulink
#import "components.typ": bullet-list, entry

#let default-titles = (
  education: "Education",
  experience: "Work Experience",
  projects: "Projects",
  activities: "Extracurricular Activities",
  skills: "Skills",
)

#let education(e) = entry(
  strong(e.at("name", default: e.at("institution", default: ""))),
  tr: e.at("location", default: none),
  bl: opt(e.at("degree", default: none), emph),
  br: opt(dates(e.at("dates", default: none)), emph),
  bullets: e.at("description", default: none),
)

#let project(p) = {
  let name = p.at("name", default: "")
  let url = p.at("url", default: none)
  let role = p.at("role", default: none)
  let title = if role != none [*#role*, #name] else [*#name*]
  if url != none { title += [ (#ulink(url, pretty-url(url)))] }
  entry(
    title,
    tr: dates(p.at("dates", default: none)),
    bullets: p.at("description", default: none),
  )
}

#let generic(e) = entry(
  strong(e.at("role", default: e.at("title", default: e.at("name", default: "")))),
  tr: dates(e.at("dates", default: none)),
  bl: e.at("company", default: e.at("organization", default: e.at("subtitle", default: none))),
  br: opt(e.at("location", default: none), emph),
  bullets: e.at("description", default: none),
)

#let labelled(d) = list(..d.pairs().map(((label, value)) => {
  let value = if type(value) == array { value.join(", ") } else { value }
  [*#label*: #value]
}))

#let renderers = (education: education, projects: project)

#let section-body(key, value) = {
  if type(value) == dictionary { return labelled(value) }
  if type(value) != array { return bullet-list(value) }
  if value.len() > 0 and value.all(v => type(v) != dictionary) { return bullet-list(value) }
  let render = renderers.at(key, default: generic)
  for e in value { render(e) }
}

#let section(key, value, titles: default-titles) = {
  heading(level: 1, titles.at(key, default: key))
  section-body(key, value)
}
