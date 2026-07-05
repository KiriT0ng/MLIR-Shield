func.func @cant_fold_to_tensor_cast(%arg0 : f32) -> tensor<f32> {
  %out = tensor.empty() : tensor<f32>
  %g = linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = []
  } ins(%arg0 : f32)
    outs(%out : tensor<f32>) {
  ^bb0(%arg2 : f32, %arg3 : f32):
    linalg.yield %arg2 : f32
  } -> (tensor<f32>)
  return %g : tensor<f32>
}
