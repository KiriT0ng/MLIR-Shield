#map0 = affine_map<(d0, d1) -> (d0, d1)>
  func.func @fuse_multi_result_producer(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>, %arg3: tensor<f32>, %arg4: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = tensor.empty() : tensor<f32>
    %2:2 = linalg.generic {
      indexing_maps = [#map, #map, #map, #map, #map], iterator_types = []}
      ins(%arg0, %arg1, %arg1 : tensor<f32>, tensor<f32>, tensor<f32>) outs(%0, %1 : tensor<f32>, tensor<f32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32):
      %4 = arith.addf %arg5, %arg6 : f32
      %5 = arith.addf %4, %arg7 : f32
      linalg.yield %4, %5 : f32, f32
    } -> (tensor<f32>, tensor<f32>)
    %3 = linalg.generic {
      indexing_maps = [#map, #map, #map], iterator_types = []}
      ins(%2#1, %arg1 : tensor<f32>, tensor<f32>) outs(%arg4 : tensor<f32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %4 = arith.addf %arg5, %arg6 : f32
      %5 = arith.addf %4, %arg6 : f32
      linalg.yield %5 : f32
    } -> tensor<f32>
    return %3 : tensor<f32>
  }
