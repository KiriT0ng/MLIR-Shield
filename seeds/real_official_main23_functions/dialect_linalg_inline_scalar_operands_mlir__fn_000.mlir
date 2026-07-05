#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> ()>
func.func @inline_zerod(%arg0: tensor<4xf32>, %scalar: tensor<f32>) -> tensor<4xf32> {
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.generic {indexing_maps = [#map2, #map3, #map2],
                         iterator_types = ["parallel"]}
                         ins(%arg0, %scalar : tensor<4xf32>, tensor<f32>)
                         outs(%0 : tensor<4xf32>) {
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %2 = arith.divf %arg1, %arg2 : f32
      linalg.yield %2 : f32
    } -> tensor<4xf32>
  return %1 : tensor<4xf32>
}
