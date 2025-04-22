#import "lib/Common.typ": setup,
#import "lib/65x100_1Fold_AntiStaticBag.typ": (
  make-1-fold-table-with-back,
  columen-specs-base,
  entries-base,
  make-back,
)
#show: setup

#let entries = entries-base
#{
  entries.A.name = "Tick Remover"
  entries.A.quantity = 1

  entries.B.name = "Alcohol Swaps"
  entries.B.quantity = 1
  entries.B.comment = "For antiseptic cleaning of the skin"

  entries.C.name = "Cooling Gel"
  entries.C.quantity = 1
  entries.C.comment = "For burns"

  entries.D.name = "Q-Tips"
  entries.D.quantity = 2
}

#make-1-fold-table-with-back(
  columen-specs-base,
  entries,
  back: make-back("EDC_Miscellaneous"),
  // debug: true,
)
