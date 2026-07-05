func.func @fill_view0(%arg0: memref<f32>, %arg1: f32) {
  linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<f32>)
  return
}
