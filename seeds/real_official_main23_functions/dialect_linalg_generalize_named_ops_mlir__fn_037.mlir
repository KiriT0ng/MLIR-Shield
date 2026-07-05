func.func @fill_tensor(%f: f32, %v: vector<2x4xf32>) -> (tensor<f32>, tensor<vector<2x4xf32>>) {
  %e0 = tensor.empty() : tensor<f32>
  %0 = linalg.fill ins(%f : f32) outs(%e0 : tensor<f32>) -> tensor<f32>

  %e1 = tensor.empty() : tensor<vector<2x4xf32>>
  %1 = linalg.fill ins(%v : vector<2x4xf32>) outs(%e1 : tensor<vector<2x4xf32>>) -> tensor<vector<2x4xf32>>

  return %0, %1: tensor<f32>, tensor<vector<2x4xf32>>
}
