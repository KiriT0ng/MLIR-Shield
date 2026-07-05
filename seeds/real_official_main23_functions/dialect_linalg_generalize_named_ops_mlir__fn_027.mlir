func.func @generalize_round(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.round ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
