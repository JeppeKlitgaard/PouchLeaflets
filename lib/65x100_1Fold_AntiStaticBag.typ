#import "Base.typ": (
  stroke-regular,
  stroke-fat,
  stroke-cut,
  inset-size-table,
  inset-size-back,
  inset-size-back-top,
  back-row-gutter,
  id-text,
  id-col,
)
#import "65x100_AntiStaticBag_Base.typ": leaflet-width, leaflet-height, instructions-default-nofold, layout_duplex_page

/// Default content
#let make-back(leaflet-id) = grid(
  rows: (auto, 1fr, auto),
  columns: (1fr,),
  row-gutter: back-row-gutter,
  align(
    left,
    [
      === Instructions
      - Clean and dry wound
      - Cover with bandage
      - Change daily
    ],
  ),
  align(
    left + bottom,
    [
      === Information
      Leaflet ID: #raw(leaflet-id).
    ],
  ),
  align(
    bottom + center,
    [*Made by _Jeppe Klitgaard_*],
  ),
)

#let back-default = make-back("Not specified")

/// Column Spec
#let columen-specs-base = (
  id: (
    text: "ID",
    width: id-col,
    align: center,
  ),
  name: (
    text: "Name",
    width: 30mm,
    align: left,
  ),
  quantity: (
    text: "Qty",
    width: auto,
    align: right,
  ),
  comment: (
    text: "Comment",
    width: 1fr,
    align: left,
  ),
)

/// Base entries
#let entries-base = (
  "A": (
    id: "A",
    name: "",
    quantity: "",
    comment: "",
  ),
  "B": (
    id: "B",
    name: "",
    quantity: "",
    comment: "",
  ),
  "C": (
    id: "C",
    name: "",
    quantity: "",
    comment: "",
  ),
  "D": (
    id: "D",
    name: "",
    quantity: "",
    comment: "",
  ),
  "E": (
    id: "E",
    name: "",
    quantity: "",
    comment: "",
  ),
  "F": (
    id: "F",
    name: "",
    quantity: "",
    comment: "",
  ),
  "G": (
    id: "G",
    name: "",
    quantity: "",
    comment: "",
  ),
  "H": (
    id: "H",
    name: "",
    quantity: "",
    comment: "",
  ),
  "I": (
    id: "I",
    name: "",
    quantity: "",
    comment: "",
  ),
  "J": (
    id: "J",
    name: "",
    quantity: "",
    comment: "",
  ),
  "K": (
    id: "K",
    name: "",
    quantity: "",
    comment: "",
  ),
  "L": (
    id: "L",
    name: "",
    quantity: "",
    comment: "",
  ),
  "M": (
    id: "M",
    name: "",
    quantity: "",
    comment: "",
  ),
)

#let make-1-fold-table-with-back(
  column-specs,
  entries,
  back: back-default,
  instructions: instructions-default-nofold,
  debug: false,
) = {
  let num-cols = column-specs.len()
  let num-rows = entries.len()

  let this-table = table(
    columns: column-specs.values().map(c => c.width),
    align: column-specs.values().map(c => c.align),
    stroke: stroke-regular,
    inset: inset-size-table,

    table.vline(stroke: none),
    table.hline(stroke: none),

    table.header(..column-specs.values().map(c => strong(c.text)).flatten()),
    table.hline(stroke: stroke-fat),

    ..entries
      .values()
      .enumerate()
      .map(x => {
        let i = x.at(0)
        let e = x.at(1)

        let cells = (
          table.vline(stroke: none),
          id-text(e.id),
          table.vline(stroke: stroke-fat),
          emph(e.name),
          table.vline(stroke: stroke-regular),
          [#e.quantity],
          table.vline(stroke: stroke-regular),
          text(8pt, e.comment),
          table.vline(stroke: none),
        )

        return cells
      })
      .flatten(),

    table.vline(stroke: none),
    table.hline(stroke: none),
  )

  let front-box = box(
    width: leaflet-width,
    height: leaflet-height,
    this-table,
  )

  let back-box = box(
      width: leaflet-width,
      height: leaflet-height,
      inset: (y: inset-size-back, left: inset-size-back, right: inset-size-back-top),
      rotate(90deg, back, reflow: true),
    )

  layout_duplex_page(
    front-box,
    back-box,
    instructions,
    debug,
  )
}
