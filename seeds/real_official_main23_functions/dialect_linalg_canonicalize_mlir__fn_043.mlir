func.func @dedeplicate_regression_test(%0: tensor<4xf32>, %1: tensor<4xf32>) {
  %36 = linalg.generic
    {indexing_maps = [affine_map<(d0) -> (d0)>,
                      affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
     iterator_types = ["parallel"]}
    ins(%1, %1 : tensor<4xf32>, tensor<4xf32>)
    outs(%0 : tensor<4xf32>) {
  ^bb0(%in: f32, %in_24: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<4xf32>
  %53 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>],
                        iterator_types = ["parallel"]}
                        outs(%36 : tensor<4xf32>) {
  ^bb0(%out: f32):
    linalg.yield %out : f32
  } -> tensor<4xf32>
  return
}
