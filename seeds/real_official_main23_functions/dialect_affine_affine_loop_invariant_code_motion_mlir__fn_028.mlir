func.func @affine_invariant_use_after_dma(%arg0: memref<10485760xi32>, %arg1: memref<1xi32>, %arg2: memref<10485760xi32>) {
  %c320 = arith.constant 320 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %alloc = memref.alloc() {alignment = 16 : i64} : memref<0xi32, 2>
  %alloc_0 = memref.alloc() : memref<1xi32, 2>
  affine.for %arg3 = 0 to 64 {
    %0 = affine.apply #map(%arg3)
    %alloc_1 = memref.alloc() {alignment = 16 : i64} : memref<0xi32, 2>
    %alloc_2 = memref.alloc() : memref<320xi32, 2>
    affine.dma_start %arg0[%0], %alloc_2[%c0], %alloc_1[%c0], %c320 : memref<10485760xi32>, memref<320xi32, 2>, memref<0xi32, 2>
    affine.dma_start %arg1[%c0], %alloc_0[%c0], %alloc[%c0], %c1 : memref<1xi32>, memref<1xi32, 2>, memref<0xi32, 2>
    affine.dma_wait %alloc_1[%c0], %c320 : memref<0xi32, 2>
    affine.dma_wait %alloc[%c0], %c1 : memref<0xi32, 2>
    %1 = affine.apply #map(%arg3)
    %alloc_3 = memref.alloc() {alignment = 16 : i64} : memref<0xi32, 2>
    %alloc_4 = memref.alloc() : memref<320xi32, 2>
    affine.for %arg4 = 0 to 320 {
      %2 = affine.load %alloc_2[%arg4] : memref<320xi32, 2>
      %3 = affine.load %alloc_0[0] : memref<1xi32, 2>
      %4 = arith.addi %2, %3 : i32
      %5 = arith.addi %4, %2 : i32
      affine.store %5, %alloc_4[%arg4] : memref<320xi32, 2>
    }
    affine.dma_start %alloc_4[%c0], %arg2[%1], %alloc_3[%c0], %c320 : memref<320xi32, 2>, memref<10485760xi32>, memref<0xi32, 2>
    affine.dma_wait %alloc_3[%c0], %c320 : memref<0xi32, 2>
  }
  return
}
