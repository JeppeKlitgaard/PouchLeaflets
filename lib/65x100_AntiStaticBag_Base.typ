#import "Base.typ": stroke-regular, stroke-fat, stroke-cut, stroke-fold, stroke-spacer, inset-size, inset-size-back

#let leaflet-width = 93mm
#let leaflet-height = 62mm
#let leaflet-width-inner = leaflet-width - 3mm

/// Spacers
#let leaflet-horizontal-spacer = line(
  start: (0mm, 0mm),
  end: (leaflet-width, 0mm),
  stroke: stroke-spacer,
)
#let leaflet-horizontal-spacer-inner = line(
  start: (0mm, 0mm),
  end: (leaflet-width-inner, 0mm),
  stroke: stroke-spacer,
)

#let instructions-default-nofold = [
  = Instructions
  Print on both sides of paper (Duplex, flip along long edge / left bind).

  Cut along #box(line(start: (0mm, 0mm), end: (10mm, 0mm), stroke: stroke-cut), baseline: -2pt) lines.

  Designed for 65×100mm working 'volume' anti-static bags (80×120mm).

  Fits Maxpedition Micro Pocket Pouch

  Jeppe Klitgaard\
  #datetime.today().display()
]

#let instructions-default-fold = [
  = Instructions
  Print on both sides of paper (Duplex, flip along long edge).

  Cut along #box(line(start: (0mm, 0mm), end: (10mm, 0mm), stroke: stroke-cut), baseline: -2pt) lines.

  Fold along #box(line(start: (0mm, 0mm), end: (10mm, 0mm), stroke: stroke-fold), baseline: -2pt) lines.

  Designed for 65×100mm working 'volume' anti-static bags (80×120mm).

  Fits Maxpedition Micro Pocket Pouch

  Jeppe Klitgaard\
  #datetime.today().display()
]

#let layout_duplex_page(
  front,
  back,
  front-instructions, // This one may need to be padded on top, caller should do this
  debug,
) = {
  let front-box = box(
    inset: inset-size,
    stroke: stroke-cut,
    front,
  )

  let back-box = align(right, box(
    inset: inset-size,
    stroke: if debug { stroke-cut } else { none },
    back,
  ))

  let content = [
    #front-box

    #v(10mm)
    #front-instructions
    #pagebreak()
    #back-box

  ]

  if debug {
    let front-width = context (measure(front-box).width.mm())
    let front-height = context (measure(front-box).height.mm())
    let back-width = context (measure(back-box).width.mm())
    let back-height = context (measure(back-box).height.mm())

    let debug-content = box([
      #v(10mm)

      = Debug Information

      Front size: #front-width x #front-height mm

      Back size: #back-width x #back-height mm
    ])

    content += debug-content
  }

  return content
}
