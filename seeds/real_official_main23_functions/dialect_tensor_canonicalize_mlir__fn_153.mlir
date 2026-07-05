func.func @sink_expand_of_cast(%arg0 : tensor<?x10xf32>)
    -> tensor<?x?x?xf32> {
  %c1 = arith.constant 1 : index
  %c10 = arith.constant 10 : index
  %0 = tensor.cast %arg0 : tensor<?x10xf32> to tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%c10, %c1, %c10]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}
