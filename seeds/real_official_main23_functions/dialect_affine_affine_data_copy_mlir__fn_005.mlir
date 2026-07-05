#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @affine_parallel(%85:memref<2x5x4x2xi64>) {
  affine.for %arg0 = 0 to 2 {
    affine.parallel (%arg1) = (0) to (5) {
      affine.parallel (%arg2) = (0) to (4) {
        affine.for %arg3 = #map16(%arg0, %arg1, %arg2) to #map17(%arg0, %arg1, %arg2) {
          %105 = affine.load %85[((%arg3 floordiv 2) floordiv 4) floordiv 5, ((%arg3 floordiv 2) floordiv 4) mod 5, (%arg3 floordiv 2) mod 4, %arg3 mod 2] : memref<2x5x4x2xi64>
        }
      }
    }
  }
  // Lower and upper bounds for the region can't be determined for the outermost
  // dimension. No fast buffer generation.


  return
}
