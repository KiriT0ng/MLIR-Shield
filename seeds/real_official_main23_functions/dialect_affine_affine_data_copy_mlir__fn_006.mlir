#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @index_elt_type(%arg0: memref<1x2x4x8xindex>) {
  affine.for %arg1 = 0 to 1 {
    affine.for %arg2 = 0 to 2 {
      affine.for %arg3 = 0 to 4 {
        affine.for %arg4 = 0 to 8 {
          affine.store %arg4, %arg0[%arg1, %arg2, %arg3, %arg4] : memref<1x2x4x8xindex>
        }
      }
    }
  }


  return
}
