#import "lib/Common.typ": setup,
#import "lib/65x100_3Fold_AntiStaticBag.typ": (
  make-3-fold-table-with-back,
  column-specs-medicine,
  entries-medicine-base,
  make-back3,
)
#show: setup

#let entries = entries-medicine-base
#{
  entries.A.quantity = 6
  entries.B.quantity = 6
  entries.C.quantity = 4
  entries.D.quantity = 2
  entries.E.quantity = 2
  entries.F.quantity = 0
  entries.G.quantity = 0

  entries.X = (
    id: "X",
    effect: "Prescription",
    name: "AAA",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: 2,
    instructions: "",
  )

  entries.Y = (
    id: "Y",
    effect: "Prescription",
    name: "BBB",
    tablet_dose: "",
    typical_dose: "",
    minimum_interval: "",
    maximum_daily_dose: "",
    quantity: 2,
    instructions: "",
  )
}

#make-3-fold-table-with-back(
  column-specs-medicine,
  entries,
  back3: make-back3("EDC_Medicine/Personal"),
  // debug: true,
)
