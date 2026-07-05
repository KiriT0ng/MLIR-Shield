#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @ind_linalg_dynamic_tensor_687(%lhs: tensor<5x5xf32>, %rhs: tensor<5x5xf32>) -> tensor<5x5xf32> {
  %init = tensor.empty() : tensor<5x5xf32>
  %out = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%lhs, %rhs : tensor<5x5xf32>, tensor<5x5xf32>) outs(%init : tensor<5x5xf32>) {
  ^bb0(%a: f32, %b: f32, %old: f32):
    %sum = arith.addf %a, %b : f32
    linalg.yield %sum : f32
  } -> tensor<5x5xf32>
  return %out : tensor<5x5xf32>
}
