#import "Base.typ": stroke-regular, stroke-fat, stroke-cut, stroke-fold, inset-size-table, inset-size-back, id-col, id-text
#import "65x100_AntiStaticBag_Base.typ": (
  leaflet-width,
  leaflet-width-inner,
  leaflet-height,
  leaflet-horizontal-spacer,
  leaflet-horizontal-spacer-inner,
  instructions-default-fold,
  layout_duplex_page,
)

/// Configuration
#let total-width = leaflet-width * 2 + leaflet-width-inner

#let exp-id-col = 14mm
#let expiry-col = 16mm

#let midspacer-width = 1mm
#let row-spacer-height = 10mm

/// Convenience functions and constants
#let midspace-cell = table.cell(stroke: none, "")

/// Default content
#let back1-default = align(
  left,
  [
    === Instructions
    Using a small permanent marker, mark pills according to their `ID` in the table.

    Give them a numeric `Exp. ID` (`1`, `2`, ...), which you also
    write on the pills.

    Fill in one of the _Expiry_ column pairs in the inner fold. Write the expiry
    date of the medicine in the `Expiry` columns in a `YYYY-MM` (ISO-8601) format.

    Discard expired medicine.
  ],
)

#let back2-default = align(
  left,
  [
    === First Aid Instructions
    - Check for danger
    - Call emergency services
      - EU: 112, UK: 999, US/CA: 911
    - Clear airway
    - Check breathing
    - Check pulse
    - Give CPR if needed
      - 30 chest compressions
      - 2 rescue breaths
      - Repeat
    - Stop bleeding
    - Treat for shock if needed
      - Lay flat, elevate legs
      - Remove tight clothing
      - Keep warm
      - Keep communicating
    - Stay with victim
  ],
)

#let make-back3(leaflet-id) = grid(
  rows: (auto, 1fr),
  align(
    left,
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

}

#let back3-default = make-back3("Not specified")

/// Medicine Column Spec
#let column-specs-medicine = (
  id: (
    text: "ID",
    width: id-col,
    align: center,
  ),
  effect: (
    text: "Effect",
    width: auto,
    align: left,
  ),
  name: (
    text: "Name",
    width: auto,
    align: left,
  ),
  tablet_dose: (
    text: "Tab. Dose",
    width: 18mm,
    align: right,
  ),
  typical_dose: (
    text: "Typ. Dose",
    width: 18mm,
    align: right,
  ),
  midspace1_1: (
    text: "",
    width: midspacer-width,
    align: center,
  ),
  midspace1_2: (
    text: "",
    width: midspacer-width,
    align: center,
  ),
  id2: (
    text: "ID",
    width: id-col,
    align: center,
  ),
  minimum_interval: (
    text: "Min Int.",
    width: auto,
    align: right,
  ),
  maximum_daily_dose: (
    text: "Max Daily",
    width: auto,
    align: right,
  ),
  quantity: (
    text: "Qty",
    width: auto,
    align: right,
  ),
  instructions: (
    text: "Instructions",
    width: 1fr,
    align: left,
  ),
  fold_instructions: (
    text: "",
    width: auto,
    align: center,
  ),
  midspace2_1: (
    text: "",
    width: midspacer-width,
    align: center,
  ),
  midspace2_2: (
    text: "",
    width: midspacer-width,
    align: center,
  ),
  id3: (
    text: "ID",
    width: id-col,
    align: center,
  ),
  expiry_id_1: (
    text: "Exp. ID",
    width: exp-id-col,
    align: center,
  ),
  expiry_1: (
    text: "Expiry",
    width: expiry-col,
    align: center,
  ),
  expiry_id_2: (
    text: "Exp. ID",
    width: exp-id-col,
    align: center,
  ),
  expiry_2: (
    text: "Expiry",
    width: expiry-col,
    align: center,
  ),
  comments: (
    text: "Comments",
    width: auto,
    align: center,
  ),
)

/// Base entries
#let entries-medicine-base = (
  "A": (
    id: "A",
    effect: "Pain",
    name: "Paracetamol",
    tablet_dose: "500 mg",
    typical_dose: "1000 mg",
    minimum_interval: "4 h",
    maximum_daily_dose: "4000 mg",
    quantity: 4,
    instructions: "",
  ),
  "B": (
    id: "B",
    effect: "Pain",
    name: "Ibuprofen",
    tablet_dose: "200 mg",
    typical_dose: "400 mg",
    minimum_interval: "4-6 h",
    maximum_daily_dose: "1200 mg",
    quantity: 4,
    instructions: "",
  ),
  "C": (
    id: "C",
    effect: "Diarrhea",
    name: "Loperamide",
    tablet_dose: "2 mg",
    typical_dose: "4 mg",
    minimum_interval: "1 h",
    maximum_daily_dose: "16 mg",
    quantity: 4,
    instructions: "4 mg, then 2 mg / loose stool",
  ),
  "D": (
    id: "D",
    effect: "Antacid",
    name: "Balancid Novum",
    tablet_dose: "",
    typical_dose: "1-2 tablets",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: 2,
    instructions: "Chew, after meal",
  ),
  "E": (
    id: "E",
    effect: "Anti-Hist.",
    name: "Alnok",
    tablet_dose: "10 mg",
    typical_dose: "10 mg",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: 2,
    instructions: "Chew, after meal",
  ),
  "F": (
    id: "F",
    effect: "Throat",
    name: "Strepsil",
    tablet_dose: "",
    typical_dose: "1 lozenge",
    minimum_interval: "2-3 h",
    maximum_daily_dose: "12 loze.",
    quantity: 2,
    instructions: "Suck slowly",
  ),
  "G": (
    id: "G",
    effect: "Motion Sick.",
    name: "Cyclizine",
    tablet_dose: "50 mg",
    typical_dose: "50 mg",
    minimum_interval: "8 h",
    maximum_daily_dose: "150 mg",
    quantity: 4,
    instructions: "Take 1-2 hours before travel",
  ),
  "H": (
    id: "H",
    effect: "",
    name: "",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: "",
    instructions: "",
  ),
  "I": (
    id: "I",
    effect: "",
    name: "",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: "",
    instructions: "",
  ),
  "J": (
    id: "J",
    effect: "",
    name: "",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: "",
    instructions: "",
  ),
  /// Prescription
  "X": (
    id: "X",
    effect: "Prescription",
    name: "",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: "",
    instructions: "",
  ),
  "Y": (
    id: "Y",
    effect: "Prescription",
    name: "",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: "",
    instructions: "",
  ),
  "Z": (
    id: "Z",
    effect: "Prescription",
    name: "",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: "",
    instructions: "",
  ),
)

#let make-3-fold-table-with-back(
  column-specs,
  entries,
  back1: back1-default,
  back2: back2-default,
  back3: back3-default,
  instructions: instructions-default-fold,
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
          e.effect,
          emph(e.name),
          e.tablet_dose,
          e.typical_dose,
          table.vline(stroke: none),
          midspace-cell,
          table.vline(stroke: stroke-fold),
          midspace-cell,
          table.vline(stroke: none),
          id-text(e.id),
          table.vline(stroke: stroke-fat),
          e.minimum_interval,
          e.maximum_daily_dose,
          [#e.quantity],
          text(8pt, e.instructions),
        )

        if i == 0 {
          let instructions = "↓ Information Inside ↓"
          instructions = text(size: 8pt, weight: "bold", instructions)
          instructions = rotate(-90deg, reflow: true, instructions)
          instructions = align(
            horizon,
            instructions,
          )

          cells.push(table.cell(rowspan: num-rows, instructions))
        }

        cells.push((
          table.vline(stroke: none),
          midspace-cell,
          table.vline(stroke: stroke-fold),
          midspace-cell,
          table.vline(stroke: none),
          id-text(e.id),
          table.vline(stroke: stroke-fat),
          "", // Expiry ID 1
          "", // Expiry 1
          table.vline(stroke: stroke-fat),
          "", // Expiry ID 2
          "", // Expiry 2
          table.vline(stroke: stroke-fat),
          "", // Empty
        ))


        return cells
      })
      .flatten(),

    table.vline(stroke: none),
    table.hline(stroke: none),

    table.cell(colspan: num-cols, v(row-spacer-height), stroke: none),

    table.cell(colspan: 6, inset: (x: 0mm), stroke: none, "Spacer 1"),
    table.cell(colspan: 8, inset: (x: 0mm), stroke: none, leaflet-horizontal-spacer),
    table.cell(colspan: num-cols - 8 - 6, inset: (x: 0mm), stroke: none, leaflet-horizontal-spacer-inner),

    table.cell(colspan: 6, inset: (x: 0mm), stroke: none, leaflet-horizontal-spacer),
    table.cell(colspan: 8, inset: (x: 0mm), stroke: none, "Spacer 2"),
    table.cell(colspan: num-cols - 8 - 6, inset: (x: 0mm), stroke: none, leaflet-horizontal-spacer-inner),

    table.cell(colspan: 6, inset: (x: 0mm), stroke: none, leaflet-horizontal-spacer),
    table.cell(colspan: 8, inset: (x: 0mm), stroke: none, leaflet-horizontal-spacer),
    table.cell(colspan: num-cols - 8 - 6, inset: (x: 0mm), stroke: none, "Spacer 3"),
  )

  let this-table-box = box(
    width: total-width,
    this-table,
    height: leaflet-height + row-spacer-height + 3em,
  )

  let front-box = box(
    height: leaflet-height,
    this-table-box,
  )

  let back-box = box(
    width: total-width,
    height: leaflet-height,
    grid(
      columns: (leaflet-width, leaflet-width, leaflet-width-inner),
      rows: (leaflet-height,) * 1,
      stroke: if debug {
        (x, y) => {
          let s = (
            top: none,
            bottom: none,
            left: none,
            right: none,
          )

          if 0 < x and x < 3 {
            s.left = stroke-fold
          }

          return s
        }
      } else { none },
      inset: inset-size-back,
      align: (right, right, right),
      rotate(90deg, back3, reflow: true), rotate(90deg, back2, reflow: true), rotate(90deg, back1, reflow: true),
    ),
  )

  instructions = [
    #v(10mm)
    #instructions
  ]

  layout_duplex_page(
    front-box,
    back-box,
    instructions,
    debug,
  )
}
