func.func @partial_sink_expand_of_cast(%arg0 : tensor<10x10xf32>, %arg1 : index, %arg2 : index)
    -> tensor<?x?x?xf32> {
  %c10 = arith.constant 10 : index
  %0 = tensor.cast %arg0 : tensor<10x10xf32> to tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%arg1, %arg2, %c10]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}
