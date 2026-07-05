module {
  func.func @fill_tensor(%out: tensor<4xf32>) -> tensor<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%out : tensor<4xf32>) -> tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}
