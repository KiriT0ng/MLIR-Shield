func.func @fold_divsi_of_muli_1(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 overflow<nsw> : index
  %1 = arith.divsi %0, %arg1 : index
  return %1 : index
}
