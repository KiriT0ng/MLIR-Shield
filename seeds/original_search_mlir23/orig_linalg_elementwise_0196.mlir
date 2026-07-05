#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @orig_linalg_elementwise_196(%a: tensor<2x3xf32>, %b: tensor<2x3xf32>, %out: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]}
      ins(%a, %b : tensor<2x3xf32>, tensor<2x3xf32>)
      outs(%out : tensor<2x3xf32>) {
    ^bb0(%x: f32, %y: f32, %z: f32):
      %r = arith.addf %x, %y : f32
      linalg.yield %r : f32
  } -> tensor<2x3xf32>
  return %0 : tensor<2x3xf32>
}
