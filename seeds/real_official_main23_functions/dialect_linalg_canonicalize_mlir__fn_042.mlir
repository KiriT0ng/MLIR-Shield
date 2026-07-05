func.func @erase_non_identity_noop(%arg0 : tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
  %0 = linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = ["parallel", "parallel"]
  } ins(%arg0 : tensor<?x?xf32>)
    outs(%arg1 : tensor<?x?xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in: f32
  } -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}
