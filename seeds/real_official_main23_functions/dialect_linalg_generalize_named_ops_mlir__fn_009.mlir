func.func @generalize_fill(%output: memref<?x?xf32>, %value : f32) {
  linalg.fill ins(%value : f32) outs(%output : memref<?x?xf32>)
  return
}
