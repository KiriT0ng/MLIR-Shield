func.func @transpose_unpacked_dims_no_fold(%arg0: tensor<2x16x5x4x3xi32>) -> tensor<5x32x12xi32> {
  %0 = tensor.empty() : tensor<5x2x3x16x4xi32>
  %transposed = linalg.transpose ins(%arg0 : tensor<2x16x5x4x3xi32>)
                outs(%0 : tensor<5x2x3x16x4xi32>)
                permutation = [2, 0, 4, 1, 3]
  %1 = tensor.empty() : tensor<5x32x12xi32>
  %unpack = linalg.unpack %transposed
            inner_dims_pos = [1, 2]
            inner_tiles = [16, 4] into
            %1 : tensor<5x2x3x16x4xi32> -> tensor<5x32x12xi32>
  return %unpack : tensor<5x32x12xi32>
}
