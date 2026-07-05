func.func private @init_and_dot(%a: tensor<64xf32>, %b: tensor<64xf32>, %c: tensor<f32>) -> tensor<f32> {
  %v0 = arith.constant 0.0 : f32

  %d = linalg.fill ins(%v0 : f32) outs(%c : tensor<f32>) -> tensor<f32>

  %e = linalg.dot ins(%a, %b : tensor<64xf32>,tensor<64xf32>)
    outs(%d: tensor<f32>) -> tensor<f32>

  return %e : tensor<f32>
}
