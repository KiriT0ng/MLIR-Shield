func.func @generalize_log(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.log ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}
