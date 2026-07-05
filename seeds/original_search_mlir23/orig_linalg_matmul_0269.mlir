func.func @orig_linalg_matmul_269(%a: tensor<4x4xf32>, %b: tensor<4x4xf32>) -> tensor<4x4xf32> {
  %out = tensor.empty() : tensor<4x4xf32>
  %zero = arith.constant 0.000000e+00 : f32
  %filled = linalg.fill ins(%zero : f32) outs(%out : tensor<4x4xf32>) -> tensor<4x4xf32>
  %0 = linalg.matmul ins(%a, %b : tensor<4x4xf32>, tensor<4x4xf32>) outs(%filled : tensor<4x4xf32>) -> tensor<4x4xf32>
  return %0 : tensor<4x4xf32>
}
