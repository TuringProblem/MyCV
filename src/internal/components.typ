/**
* author: Andrew 09292026 : @1509 
**/

#let bullet-list(items) = {
  if items == none { return }
  if type(items) != array { items = (items,) }
  let out = ()
  for it in items {
    if type(it) == array and out.len() > 0 {
      out.at(-1) = out.at(-1) + bullet-list(it)
    } else {
      out.push([#it])
    }
  }
  if out.len() > 0 { list(..out) }
}

#let entry(tl, tr: none, bl: none, br: none, bullets: none) = block(below: 0.9em, {
  let cells = (tl, tr)
  if bl != none or br != none { cells += (bl, br) }
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    row-gutter: 0.55em,
    ..cells.map(c => if c == none { [] } else { c }).enumerate().map(((i, c)) => {
      if calc.odd(i) { align(right, c) } else { c }
    })
  )
  if bullets != none {
    v(0.55em, weak: true)
    bullet-list(bullets)
  }
})
