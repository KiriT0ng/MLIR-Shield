func.func @generalize_reciprocal(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.reciprocal ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
