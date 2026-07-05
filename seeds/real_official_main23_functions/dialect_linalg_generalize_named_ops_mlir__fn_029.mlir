func.func @generalize_rsqrt(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.rsqrt ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
