#import "lib/Common.typ": setup,
#import "lib/65x100_3Fold_AntiStaticBag.typ": (
  make-3-fold-table-with-back,
  column-specs-medicine,
  entries-medicine-base,
  make-back3,
)
#show: setup

#make-3-fold-table-with-back(
  column-specs-medicine,
  entries-medicine-base,
  back3: make-back3("EDC_Medicine"),
  // debug: true,
)
