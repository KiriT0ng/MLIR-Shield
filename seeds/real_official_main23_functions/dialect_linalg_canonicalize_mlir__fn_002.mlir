func.func @dce_self_linalg_copy(%arg0 : memref<?xf32>) {
  linalg.copy ins(%arg0: memref<?xf32>) outs(%arg0: memref<?xf32>)
  return
}
