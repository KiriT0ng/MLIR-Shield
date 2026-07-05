func.func @scf_for_canonicalize_partly(%A : memref<i64>) {
  // This should canonicalize only partly: 256 - %i <= 256.
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c256 = arith.constant 256 : index

  scf.for %i = %c1 to %c256 step %c16 {
    %1 = affine.min affine_map<(d0) -> (256, 256 - d0)> (%i)
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
