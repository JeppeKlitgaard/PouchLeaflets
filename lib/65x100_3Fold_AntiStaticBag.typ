#import "Base.typ": (
  stroke-regular,
  stroke-fat,
  stroke-cut,
  stroke-fold,
  inset-size-table,
  inset-size-back,
  inset-size-back-top,
  front-size,
  front-instructions-size,
  back-size,
  back-instructions-size,
  back-instructions-leading,
  back-instructions-spacing,
  back-row-gutter,
  id-col,
  id-text,
)
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
    Using a small permanent marker, mark pills according to the table.

    Give them a numeric `Exp. ID`.

    Fill in one of the _Expiry_ column pairs in the inner fold. Write the expiry
    date in the `Expiry` columns in a `YYYY-MM` (ISO-8601) format.

    Example: Paracetamol, 500 mg (`A`) with expiry date `2030-01` would be marked `A1`
    on the pill. The first expiry columns would be filled:\
    #align(
      center,
      table(
        inset: inset-size-table,
        stroke: none,
        columns: (id-col, exp-id-col, expiry-col),
        align: (center, center, center),
        table.header(
          table.vline(stroke: none),
          strong("ID"),
          table.vline(stroke: stroke-fat),
          strong("Exp. ID"),
          table.vline(stroke: stroke-regular),
          strong("Expiry"),
          table.vline(stroke: stroke-fat),
        ),
        table.hline(stroke: stroke-fat),

        table.vline(stroke: stroke-fat),
        id-text("A"),
        `A1`, // Expiry ID 1
        `2030-01`, // Expiry 1
        table.hline(stroke: stroke-regular),
      ),
    )

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

#let back3-top-default = [
  === Additional Content
  - 2 × Bandages
]
#let back3-bottom-default = align(
  bottom + center,
  [*Made by _Jeppe Klitgaard_*],
)
#let make-back3-information(leaflet-id) = [
    === Information
    Leaflet ID: #raw(leaflet-id)
]
#let back3-information-default = make-back3-information("Not specified")

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
    text: "Name/Compound",
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
    additional_information: none,
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
    additional_information: none,
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
    additional_information: none,
  ),
  "D": (
    id: "D",
    effect: "Antacid",
    name: "Calcium Carbonate",
    tablet_dose: "500 mg",
    typical_dose: "1-2 tablets",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: 2,
    instructions: "Chew thoroughly. Take after meal",
    additional_information: [
      May be replaced with products with similar salts as active ingredients.
      For example Balancid Novum (449 mg $"CaCO"_3$, 104mg $"Mg"("OH")_2$
    ],
  ),
  "E": (
    id: "E",
    effect: "Anti-Hist.",
    name: "Cetirizine",
    tablet_dose: "10 mg",
    typical_dose: "10 mg",
    minimum_interval: "1 d",
    maximum_daily_dose: "10 mg",
    quantity: 2,
    instructions: "",
    additional_information: none,
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
    additional_information: none,
  ),
  "G": (
    id: "G",
    effect: "Nausea/Travel",
    name: "Cyclizine",
    tablet_dose: "50 mg",
    typical_dose: "50 mg",
    minimum_interval: "8 h",
    maximum_daily_dose: "150 mg",
    quantity: 4,
    instructions: "Take 1-2 hours before travel",
    additional_information: none,
  ),
  "H": (
    id: "H",
    effect: "Laxative",
    name: "Magnesium Oxide",
    tablet_dose: "500 mg",
    typical_dose: "1.0-1.5 g",
    minimum_interval: "",
    maximum_daily_dose: "2000 mg",
    quantity: "3",
    instructions: "At bedtime. Effect in 6-8 hours",
    additional_information: none,
  ),
  "H2": (
    id: "H",
    effect: "Antacid",
    name: "Magnesium Oxide",
    tablet_dose: "500 mg",
    typical_dose: "0.5-1.0 g",
    minimum_interval: "",
    maximum_daily_dose: "2000 mg",
    quantity: "3",
    instructions: [Prefer `D` ($"CaCO"_3$). Effect in 1 hour],
    additional_information: none,
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
    additional_information: none,
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
    additional_information: none,
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
    additional_information: none,
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
    additional_information: none,
  ),
)

#let make-3-fold-table-with-back(
  column-specs,
  entries,
  back1: back1-default,
  back2: back2-default,
  back3-top: back3-top-default,
  back3-bottom: back3-bottom-default,
  back3-information: back3-information-default,
  instructions: instructions-default-fold,
  debug: false,
) = {
  let num-cols = column-specs.len()
  let num-rows = entries.len()

  let additional-instructions-counter = counter("additional-instructions")
  additional-instructions-counter.update(0)
  let additional-instructions-array = ()

  // Front
  let (this-table-cells, additional-instructions-array) = array.zip(..entries
      .values()
      .enumerate()
      .map(x => {
        let i = x.at(0)
        let e = x.at(1)

        let additional-instructions-entry = none
        let name-content = emph(e.name)

        if e.additional_information != none {
          let step = additional-instructions-counter.step()
          let asterisks = context {return "*" * additional-instructions-counter.get().at(0)}

          additional-instructions-entry = (
            asterisks: asterisks,
            entry: e,
          )
          name-content += step + asterisks
        }

        let cells = (
          table.vline(stroke: none),
          id-text(e.id),
          table.vline(stroke: stroke-fat),
          e.effect,
          name-content,
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

        return (cells, additional-instructions-entry)
    }))

  let this-table = table(
    columns: column-specs.values().map(c => c.width),
    align: column-specs.values().map(c => c.align),
    stroke: stroke-regular,
    inset: inset-size-table,

    table.vline(stroke: none),
    table.hline(stroke: none),

    table.header(..column-specs.values().map(c => strong(c.text)).flatten()),
    table.hline(stroke: stroke-fat),

    ..this-table-cells.flatten(),

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
    text(size: front-size, this-table-box),
  )

  // Back
  let back3-top-additional = [=== Additional Instructions]
  back3-top-additional += additional-instructions-array.filter(x => x != none).map(x => {
    let start = [*#x.entry.id* | #emph(x.entry.name)#x.asterisks: ]
    let end = text(size: back-instructions-size, x.entry.additional_information)
    return par(
      leading: back-instructions-leading,
      spacing: back-instructions-spacing,
      start + end
    )
  }).join()

  let back3 = grid(
    rows: (auto, 1fr, auto),
    columns: (1fr,),
    row-gutter: back-row-gutter,
    align(left, back3-top + back3-top-additional),
    align(bottom + left, back3-information),
    align(
      bottom + center,
      [*Made by _Jeppe Klitgaard_*],
    )
  )

  let back-box = box(
    width: total-width,
    height: leaflet-height,
    text(back-size, grid(
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
      inset: (y: inset-size-back, left: inset-size-back, right: inset-size-back-top),
      align: (right, right, right),
      rotate(90deg, back3, reflow: true),
      rotate(90deg, back2, reflow: true),
      rotate(90deg, back1, reflow: true),
    ),
  ))

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
