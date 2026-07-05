func.func @side_effecting_ops() {
  %cst = arith.constant 0.0 : f32
  %m0 = memref.alloc(): memref<1x512x16x16xf32>
  %0 = gpu.wait async
  affine.for %arg783 = 0 to 14 {
    affine.for %arg784 = 0 to 14 {
      affine.parallel (%arg785) = (0) to (512) {
        affine.for %arg786 = 0 to 1 {
          affine.for %arg787 = 0 to 1 {
            affine.for %arg788 = 0 to 1 {
              %m1 = memref.alloc() : memref<1xf32, 3>
              %m2 = memref.alloc() : memref<1xf32, 3>
              affine.store %cst, %m1[0] : memref<1xf32, 3>
              affine.store %cst, %m2[0] : memref<1xf32, 3>
              %memref_2897, %asyncToken_2898 = gpu.alloc async [%0] () : memref<1x512x16x16xf32>
              %2432 = gpu.memcpy async [%0] %memref_2897, %m0 : memref<1x512x16x16xf32>, memref<1x512x16x16xf32>
              affine.for %arg789 = 0 to 16 {
                affine.for %arg790 = 0 to 16 {
                  affine.store %cst, %memref_2897[0, %arg785 + %arg788, %arg789, %arg790] : memref<1x512x16x16xf32>
                }
              }
              memref.dealloc %m2 : memref<1xf32, 3>
              memref.dealloc %m1 : memref<1xf32, 3>
              %2433 = gpu.memcpy async [%0] %m0, %memref_2897 : memref<1x512x16x16xf32>, memref<1x512x16x16xf32>
              %2434 = gpu.dealloc async [%asyncToken_2898] %memref_2897 : memref<1x512x16x16xf32>
            }
          }
        }
      }
    }
  }
  return
}
