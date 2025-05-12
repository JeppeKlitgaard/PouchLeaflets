#import "lib/Common.typ": setup,
#import "lib/65x100_3Fold_AntiStaticBag.typ": (
  make-3-fold-table-with-back,
  column-specs-medicine,
  entries-medicine-base,
  make-back3-information,
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
}

#make-3-fold-table-with-back(
  column-specs-medicine,
  entries,
  back3-information: make-back3-information("FirstAid"),
  // debug: true,
)
