func.func @generalize_square(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.square ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
