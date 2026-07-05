#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @zero_step(%arg0: memref<i64>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %foldto0 = arith.subi %c1, %c1 : index
  scf.for %arg2 = %c0 to %c1 step %foldto0 {
    %2 = arith.index_cast %arg2 : index to i64
    memref.store %2, %arg0[] : memref<i64>
  }
  return
}
