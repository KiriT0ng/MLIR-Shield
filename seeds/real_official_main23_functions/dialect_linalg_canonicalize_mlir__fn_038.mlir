func.func @fold_linalgop_with_cast_consumer(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>,
    %arg2 : tensor<?x?xf32>) -> (tensor<4x8xf32>, tensor<?x?xf32>) {
  %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %1 = tensor.cast %0 : tensor<?x?xf32> to tensor<4x8xf32>
  return %1, %0 : tensor<4x8xf32>, tensor<?x?xf32>
}
