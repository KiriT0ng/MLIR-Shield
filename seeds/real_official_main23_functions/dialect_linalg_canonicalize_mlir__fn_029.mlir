func.func @cast_source(%arg0 : tensor<2x3x4xf32>, %arg1: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg0, %c0 : tensor<2x3x4xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<2x3x4xf32>
  %2 = tensor.dim %arg0, %c2 : tensor<2x3x4xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4 = tensor.cast %arg0 : tensor<2x3x4xf32> to tensor<2x?x?xf32>
  %5 = tensor.cast %arg1 : tensor<2x3x4xf32> to tensor<2x?x?xf32>
  %6 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%4, %5 : tensor<2x?x?xf32>, tensor<2x?x?xf32>)
    outs(%3 : tensor<?x?x?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32, %arg4 : f32):
    %9 = arith.addf %arg2, %arg3 : f32
    linalg.yield %9 : f32
  } -> (tensor<?x?x?xf32>)
  %7 = tensor.cast %6 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  return %7: tensor<2x3x4xf32>
}
