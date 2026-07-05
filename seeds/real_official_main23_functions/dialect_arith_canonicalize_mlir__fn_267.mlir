func.func @no_fold_divui_of_muli(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 : index
  %1 = arith.divui %0, %arg0 : index
  return %1 : index
}
