func.func @batch_reduce_matmul(%A: tensor<2x3x5xf32>, %B: tensor<2x5x7xf32>, %C: tensor<3x7xf32>) -> tensor<3x7xf32> {
  %0 = linalg.batch_reduce_matmul indexing_maps = [
                            affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                            affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                            affine_map<(d0, d1, d2, d3) -> (d1, d2)>
                           ]
    ins(%A, %B: tensor<2x3x5xf32>, tensor<2x5x7xf32>)
    outs(%C: tensor<3x7xf32>) -> tensor<3x7xf32>
  return %0 : tensor<3x7xf32>
}
