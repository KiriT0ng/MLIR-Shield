func.func @generalize_tanh(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.tanh ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
