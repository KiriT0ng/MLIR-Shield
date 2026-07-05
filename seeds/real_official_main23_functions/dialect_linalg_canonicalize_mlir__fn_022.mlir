func.func @negative_fold_fill_like_tensor(%in_out : tensor<4x16xf32>, %fill_val : f32) -> tensor<4x16xf32> {
  %result = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                   affine_map<(d0, d1) -> (d0, d1)>],
                  iterator_types = ["parallel", "parallel"]}
    ins(%in_out : tensor<4x16xf32>)
    outs(%in_out : tensor<4x16xf32>) {
      ^bb0(%arg0: f32, %arg1: f32):
        linalg.yield %fill_val : f32
  } -> tensor<4x16xf32>
  return %result : tensor<4x16xf32>
}
