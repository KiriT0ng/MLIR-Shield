func.func @generalize_erf(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.erf ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
