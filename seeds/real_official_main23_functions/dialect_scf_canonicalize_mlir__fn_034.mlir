func.func @replace_single_iteration_const_diff(%arg0 : index) {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %5 = arith.addi %arg0, %c1 overflow<nsw> : index
  scf.for %arg2 = %arg0 to %5 step %c1 {
    %7 = arith.muli %c2, %arg2 : index
    "test.consume"(%7) : (index) -> ()
  }
  return
}
