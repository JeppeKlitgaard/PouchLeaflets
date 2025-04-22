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
  entries.A.name = "Bandage (Large)"
  entries.A.quantity = 1
  entries.A.comment = "3M Nexcare"

  entries.B.name = "Bandage (Medium)"
  entries.B.quantity = 2
  entries.B.comment = "3M Nexcare"

  entries.C.name = "Bandage (Small)"
  entries.C.quantity = 2
  entries.C.comment = "3M Nexcare"

  entries.D.name = "Bandage (Long)"
  entries.D.quantity = 2

  entries.E.name = "Steri-Strip"
  entries.E.quantity = 3
  entries.E.comment = "3M, for closing cuts"

  entries.F.name = "Blister Cushion"
  entries.F.quantity = 2
  entries.F.comment = "Compeed"
}

#make-1-fold-table-with-back(
  columen-specs-base,
  entries,
  back: make-back("EDC_FirstAid"),
  // debug: true,
)
