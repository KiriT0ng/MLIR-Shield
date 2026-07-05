func.func @fold_extract_slice_into_unpack_slicing_trailing_dim(%src : tensor<28x2x1x16x16xf32>, %dest : tensor<28x28x15xf32>) -> tensor<28x28x10xf32> {
  %unpack = linalg.unpack %src
      outer_dims_perm = [0, 1, 2]
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %dest : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 28, 10] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x28x10xf32>
  return %extracted_slice : tensor<28x28x10xf32>
}
