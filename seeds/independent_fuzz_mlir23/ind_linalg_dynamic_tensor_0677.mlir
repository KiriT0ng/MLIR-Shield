#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @ind_linalg_dynamic_tensor_677(%lhs: tensor<3x3xf32>, %rhs: tensor<3x3xf32>) -> tensor<3x3xf32> {
  %init = tensor.empty() : tensor<3x3xf32>
  %out = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%lhs, %rhs : tensor<3x3xf32>, tensor<3x3xf32>) outs(%init : tensor<3x3xf32>) {
  ^bb0(%a: f32, %b: f32, %old: f32):
    %sum = arith.addf %a, %b : f32
    linalg.yield %sum : f32
  } -> tensor<3x3xf32>
  return %out : tensor<3x3xf32>
}
