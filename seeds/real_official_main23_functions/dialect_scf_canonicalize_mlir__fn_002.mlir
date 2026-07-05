func.func @single_iteration_reduce(%A: index, %B: index) -> (index, index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c6 = arith.constant 6 : index
  %0:2 = scf.parallel (%i0, %i1) = (%c1, %c3) to (%c2, %c6) step (%c1, %c3) init(%A, %B) -> (index, index) {
    scf.reduce(%i0, %i1 : index, index)  {
    ^bb0(%lhs: index, %rhs: index):
      %1 = arith.addi %lhs, %rhs : index
      scf.reduce.return %1 : index
    }, {
    ^bb0(%lhs: index, %rhs: index):
      %2 = arith.muli %lhs, %rhs : index
      scf.reduce.return %2 : index
    }
  }
  return %0#0, %0#1 : index, index
}
