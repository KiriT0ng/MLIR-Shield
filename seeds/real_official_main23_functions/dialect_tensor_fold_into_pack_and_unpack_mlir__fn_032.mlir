func.func @non_involution_transpose_unpack_fold(%arg0: tensor<2x3x5x4x16xi32>) -> tensor<5x48x8xi32> {
  %0 = tensor.empty() : tensor<5x2x3x16x4xi32>
  %transposed = linalg.transpose ins(%arg0 : tensor<2x3x5x4x16xi32>)
                outs(%0 : tensor<5x2x3x16x4xi32>)
                permutation = [2, 0, 1, 4, 3]
  %1 = tensor.empty() : tensor<5x48x8xi32>
  %unpack = linalg.unpack %transposed
            outer_dims_perm = [0, 2, 1]
            inner_dims_pos = [1, 2]
            inner_tiles = [16, 4] into
            %1 : tensor<5x2x3x16x4xi32> -> tensor<5x48x8xi32>
  return %unpack : tensor<5x48x8xi32>
}
