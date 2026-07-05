func.func @fold_expand_of_cast(%arg0 : tensor<10x10xf32>)
    -> tensor<10x1x10xf32> {
  %c1 = arith.constant 1 : index 
  %c10 = arith.constant 10 : index 
  %0 = tensor.cast %arg0 : tensor<10x10xf32> to tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%c10, %c1, %c10]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  %2 = tensor.cast %1 : tensor<?x?x?xf32> to tensor<10x1x10xf32>
  return %2 : tensor<10x1x10xf32>
}
