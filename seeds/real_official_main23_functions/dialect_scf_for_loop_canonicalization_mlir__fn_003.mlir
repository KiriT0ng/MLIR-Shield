func.func @scf_for_loop_nest_canonicalize_min(%A : memref<i64>) {
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %c6 = arith.constant 6 : index

  scf.for %i = %c0 to %c4 step %c2 {
    scf.for %j = %c0 to %c6 step %c3 {
      %1 = affine.min affine_map<(d0, d1, d2, d3)[] -> (5, d1 + d3 - d0 - d2)> (%i, %c4, %j, %c6)
      %2 = arith.index_cast %1: index to i64
      memref.store %2, %A[]: memref<i64>
    }
  }
  return
}
