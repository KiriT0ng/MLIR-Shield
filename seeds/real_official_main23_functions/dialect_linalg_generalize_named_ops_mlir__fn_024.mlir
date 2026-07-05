func.func @generalize_floor(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.floor ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
