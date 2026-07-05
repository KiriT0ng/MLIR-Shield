func.func @decompose_dynamic_concat(%arg0 : tensor<8x4xf32>, %arg1 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %0 = tensor.concat dim(1) %arg0, %arg1 : (tensor<8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}
