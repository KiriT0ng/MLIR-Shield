func.func @generalize_abs(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.abs ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
