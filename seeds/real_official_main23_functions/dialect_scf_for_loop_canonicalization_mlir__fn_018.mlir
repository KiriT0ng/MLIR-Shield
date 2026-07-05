func.func @regression_multiplication_with_sym(%A : memref<i64>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c4 = arith.constant 4 : index
  %ub = "test.dummy"() : () -> (index)
  scf.for %i = %c0 to %ub step %c1 {
    %1 = affine.min affine_map<(d0)[s0] -> (-(d0 * (5 ceildiv s0)) + 5, 3)>(%i)[%ub]
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
