func.func @cast_dest(%arg0: tensor<?x?x?xf32>, %arg1: tensor<1x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?xf32> {
  %0 = tensor.empty(%arg2, %arg3, %arg4) : tensor<?x?x?xf32>
  %1 = tensor.cast %arg1 : tensor<1x?x?xf32> to tensor<?x?x?xf32>
  %2 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<1x?x?xf32>)
    outs(%0 : tensor<?x?x?xf32>) {
  ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
    %3 = arith.subf %arg5, %arg6 : f32
    linalg.yield %3 : f32
  } -> tensor<?x?x?xf32>
  return %2 : tensor<?x?x?xf32>
}
