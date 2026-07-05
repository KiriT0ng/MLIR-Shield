#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @orig_linalg_elementwise_61(%a: tensor<3x5xf32>, %b: tensor<3x5xf32>, %out: tensor<3x5xf32>) -> tensor<3x5xf32> {
  %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]}
      ins(%a, %b : tensor<3x5xf32>, tensor<3x5xf32>)
      outs(%out : tensor<3x5xf32>) {
    ^bb0(%x: f32, %y: f32, %z: f32):
      %r = arith.mulf %x, %y : f32
      linalg.yield %r : f32
  } -> tensor<3x5xf32>
  return %0 : tensor<3x5xf32>
}
