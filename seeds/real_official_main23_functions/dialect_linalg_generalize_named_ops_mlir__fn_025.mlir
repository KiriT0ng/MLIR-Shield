func.func @generalize_negf(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.negf ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
