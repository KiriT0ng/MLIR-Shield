func.func @linalg_transpose_linalg.unpack_fold_multi_result(%arg0: tensor<1x1x4x16xi32>) -> (tensor<1x1x16x4xi32>, tensor<16x4xi32>) {
  %0 = tensor.empty() : tensor<1x1x16x4xi32>
  %transposed = linalg.transpose ins(%arg0 : tensor<1x1x4x16xi32>)
                outs(%0 : tensor<1x1x16x4xi32>)
                permutation = [1, 0, 3, 2]
  %1 = tensor.empty() : tensor<16x4xi32>
  %unpack = linalg.unpack %transposed
            outer_dims_perm = [0, 1]
            inner_dims_pos = [0, 1]
            inner_tiles = [16, 4] into
            %1 : tensor<1x1x16x4xi32> -> tensor<16x4xi32>
  return %transposed, %unpack : tensor<1x1x16x4xi32>, tensor<16x4xi32>
}
