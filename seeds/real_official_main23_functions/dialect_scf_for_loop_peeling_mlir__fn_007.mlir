#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @regression(%arg0: memref<i64>, %arg1: index) {
  %c0 = arith.constant 0 : index
  %0 = affine.apply affine_map<()[s0] -> (s0 * s0)>()[%arg1]
  scf.for %arg2 = %c0 to %0 step %arg1 {
    %1 = affine.min affine_map<(d0)[s0] -> (s0, -d0 + s0 * s0)>(%arg2)[%arg1]
    %2 = arith.index_cast %0 : index to i64
    memref.store %2, %arg0[] : memref<i64>
  }
  return
}
