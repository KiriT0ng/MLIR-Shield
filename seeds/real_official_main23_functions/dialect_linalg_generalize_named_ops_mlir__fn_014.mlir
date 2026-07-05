func.func @generalize_linalg_map(%arg0: memref<1x8x8x8xf32>, %arg1: memref<1x8x8x8xf32>, %arg2: memref<1x8x8x8xf32>) {
  %cst = arith.constant 0.000000e+00 : f32
  linalg.map {arith.addf} ins(%arg0, %arg1: memref<1x8x8x8xf32>, memref<1x8x8x8xf32>) outs(%arg2 : memref<1x8x8x8xf32>)
  return
}
