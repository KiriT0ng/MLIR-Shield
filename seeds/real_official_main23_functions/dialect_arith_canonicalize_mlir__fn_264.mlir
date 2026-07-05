func.func @fold_divui_of_muli_1(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 overflow<nuw> : index
  %1 = arith.divui %0, %arg1 : index
  return %1 : index
}
