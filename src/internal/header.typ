/**
* author: Andrew 09292026 : @1500 
**/
#import "utils.typ": is-url, pretty-url, ulink

#let contact(key, value) = {
  if key == "email" {
    ulink("mailto:" + value, value)
  } else if key == "phone" {
    link("tel:" + value.replace(regex("[^0-9+]"), ""), text(fill: black, value))
  } else if is-url(value) {
    ulink(value, pretty-url(value))
  } else {
    value
  }
}

#let header(data, accent: black, size: 10pt) = {
  let name = data.at("name", default: "")

  block(below: 0.7em, text(size: size * 2.6, fill: accent, weight: "bold", name))
  data.pairs().filter(((k, v)) => k != "name" and v not in (none, "")).map(((k, v)) => box(contact(k, v)))
  .join(h(0.5em) + text(fill: gray.darken(30%), "|") + h(0.5em))

  v(0.3em)
}
