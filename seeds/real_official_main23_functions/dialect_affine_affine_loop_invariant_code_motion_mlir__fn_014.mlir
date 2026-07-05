func.func @invariant_affine_nested_if_else2() {
  %m = memref.alloc() : memref<10xf32>
  %m2 = memref.alloc() : memref<10xf32>
  %cf8 = arith.constant 8.0 : f32
  affine.for %arg0 = 0 to 10 {
    affine.for %arg1 = 0 to 10 {
      affine.if affine_set<(d0, d1) : (d1 - d0 >= 0)> (%arg0, %arg0) {
          %cf9 = arith.addf %cf8, %cf8 : f32
          %tload1 = affine.load %m[%arg0] : memref<10xf32>
          affine.if affine_set<(d0, d1) : (d1 - d0 >= 0)> (%arg0, %arg0) {
            affine.store %cf9, %m2[%arg0] : memref<10xf32>
          } else {
            %tload2 = affine.load %m[%arg0] : memref<10xf32>
          }
      }
    }
  }



  return
}
