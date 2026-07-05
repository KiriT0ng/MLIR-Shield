func.func @static_output_with_cast(%arg0 : tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg2, %c0 : tensor<2x3x4xf32>
  %1 = tensor.dim %arg2, %c1 : tensor<2x3x4xf32>
  %2 = tensor.dim %arg2, %c2 : tensor<2x3x4xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4 = tensor.cast %3 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  %5 = tensor.cast %arg1 : tensor<?x?x?xf32> to tensor<2x?x?xf32>
  %6 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %5 : tensor<?x?x?xf32>, tensor<2x?x?xf32>)
    outs(%4 : tensor<2x3x4xf32>) {
  ^bb0(%arg3 : f32, %arg4 : f32, %arg5 : f32):
    %9 = arith.addf %arg3, %arg4 : f32
    linalg.yield %9 : f32
  } -> (tensor<2x3x4xf32>)
  return %6: tensor<2x3x4xf32>
}
