#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @empty_loops(%arg0: memref<1024x1024xf64>) {
  // Empty loops - so no copy generation happens.
  affine.for %i = 0 to 0 {
    affine.load %arg0[0, %i] : memref<1024x1024xf64>
  }
  affine.for %i = 0 to -16 {
    affine.load %arg0[0, %i] : memref<1024x1024xf64>
  }
  return
}
