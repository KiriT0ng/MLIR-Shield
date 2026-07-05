func.func @to_select_same_val(%cond: i1) -> (index, index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0, %1 = scf.if %cond -> (index, index) {
    scf.yield %c0, %c1 : index, index
  } else {
    scf.yield %c1, %c1 : index, index
  }
  return %0, %1 : index, index
}
