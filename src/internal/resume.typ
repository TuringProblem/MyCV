/**
* author: Andrew 09292026 : @14:55
**/
#import "theme.typ": apply-theme, defaults
#import "header.typ": header
#import "sections.typ": default-titles, section

#let resume(
  data,
  accent: defaults.accent,
  font: defaults.font,
  size: defaults.size,
  paper: defaults.paper,
  margin: defaults.margin,
  order: ("education", "projects", "experience", "activities", "skills"),
  titles: (:),
) = {
  let head = data.at("header", default: (:))
  let name = head.at("name", default: "")
  set document(title: name + " — Resume", author: name)

  show: apply-theme.with(accent: accent, font: font, size: size, paper: paper, margin: margin)

  header(head, accent: accent, size: size)

  let keys = order.filter(k => k in data)
  keys += data.keys().filter(k => k != "header" and k not in keys)
  let titles = default-titles + titles
  for key in keys { section(key, data.at(key), titles: titles) }
}
