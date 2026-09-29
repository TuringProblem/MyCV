/**
* author: Andrew 09292026 : @14:40
**/ 
#let pretty-url(url) = (url.replace(regex("^https?://"), "").replace(regex("^www\."), "").trim("/", at: end))
#let is-url(value) = type(value) == str and value.starts-with(regex("https?://"))
#let opt(v, f) = if v == none { none } else { f(v) }
#let ulink(url, label) = link(url, underline(offset: 2pt, label))

#let dates(d) = {
  if d == none { return none }
  if type(d) != dictionary { return d }
  let start = d.at("start", default: none)
  let end = d.at("end", default: "Present")
  if start == none { end } else [#start #sym.dash.em #end]
}
