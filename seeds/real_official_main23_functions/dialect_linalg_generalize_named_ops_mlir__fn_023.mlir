func.func @generalize_ceil(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.ceil ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
