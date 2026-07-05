func.func @fold_extract_constant_splat() -> (tensor<4x4xi32>) {
  %cst = arith.constant dense<42> : tensor<1024x1024xi32>
  %1 = tensor.extract_slice %cst[0,0] [4,4] [1, 1] : tensor<1024x1024xi32> to tensor<4x4xi32>
  return %1 : tensor<4x4xi32>
}
