func.func @generalize_sqrt(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.sqrt ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
