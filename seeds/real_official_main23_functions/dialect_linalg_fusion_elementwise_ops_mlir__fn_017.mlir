#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @no_fusion_missing_reduction_shape(%arg0: tensor<f32>, %arg1: index) -> tensor<?xf32> {
  %cst = arith.constant 0xFF800000 : f32
  %4 = tensor.empty(%arg1, %arg1) : tensor<?x?xf32>
  %5 = linalg.generic {
    indexing_maps = [#map0, #map1],
    iterator_types = ["parallel", "parallel"]
  } ins(%arg0 : tensor<f32>) outs(%4 : tensor<?x?xf32>) {
  ^bb0(%arg2: f32, %arg3: f32):
    linalg.yield %arg2 : f32
  } -> tensor<?x?xf32>
  %6 = tensor.empty(%arg1) : tensor<?xf32>
  %7 = linalg.fill ins(%cst : f32) outs(%6 : tensor<?xf32>) -> tensor<?xf32>
  %8 = linalg.generic {
    indexing_maps = [#map2, #map3],
    iterator_types = ["parallel", "reduction"]
  } ins(%5 : tensor<?x?xf32>) outs(%7 : tensor<?xf32>) {
  ^bb0(%arg2: f32, %arg3: f32):
    %9 = arith.maximumf %arg2, %arg3 : f32
    linalg.yield %9 : f32
  } -> tensor<?xf32>
  return %8 : tensor<?xf32>
}
