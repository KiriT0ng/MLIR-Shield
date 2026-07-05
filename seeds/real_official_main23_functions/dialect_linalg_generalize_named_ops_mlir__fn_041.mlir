func.func @batch_matmul(%arg0: tensor<2x3x5xf32>, %arg1: tensor<2x5x7xf32>, %arg2: tensor<2x3x7xf32>) -> tensor<2x3x7xf32> {
  %0 = linalg.batch_matmul indexing_maps = [
                            affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                            affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                            affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
                           ]
    ins(%arg0, %arg1: tensor<2x3x5xf32>, tensor<2x5x7xf32>)
    outs(%arg2: tensor<2x3x7xf32>) -> tensor<2x3x7xf32>
  return %0 : tensor<2x3x7xf32>
}
