func.func @scf_for_invalid_loop(%A : memref<i64>, %step : index) {
  // This is an invalid loop. It should not be touched by the canonicalization
  // pattern.
  %c1 = arith.constant 1 : index
  %c7 = arith.constant 7 : index
  %c256 = arith.constant 256 : index

  scf.for %i = %c256 to %c1 step %c1 {
    %1 = affine.min affine_map<(d0)[s0] -> (s0 + d0, 0)> (%i)[%c7]
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
