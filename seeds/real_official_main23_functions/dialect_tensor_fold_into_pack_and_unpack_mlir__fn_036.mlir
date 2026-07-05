func.func @unpack_generic_transpose_fold(%arg0: tensor<57x3x56x1x64xf32>) -> tensor<3648x3x56xf32> {
  %0 = tensor.empty() : tensor<3x56x3648xf32>
  %unpack = linalg.unpack %arg0
    outer_dims_perm = [2, 0, 1]
    inner_dims_pos = [1, 2]
    inner_tiles = [1, 64]
    into %0 : tensor<57x3x56x1x64xf32> -> tensor<3x56x3648xf32>

  %1 = tensor.empty() : tensor<3648x3x56xf32>
  %transposed = linalg.generic {
                iterator_types = ["parallel", "parallel", "parallel"],
                indexing_maps = [#map, #map1]}
                ins(%unpack : tensor<3x56x3648xf32>)
                outs(%1 : tensor<3648x3x56xf32>) {
  ^bb0(%in : f32, %out : f32):
    linalg.yield %in : f32
  } -> tensor<3648x3x56xf32>
  return %transposed : tensor<3648x3x56xf32>
}
