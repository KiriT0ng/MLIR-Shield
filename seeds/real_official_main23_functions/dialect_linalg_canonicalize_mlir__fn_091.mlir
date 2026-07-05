func.func @negative_fold_extract_slice_into_unpack_artificial_padding(%src : tensor<28x2x1x16x16xf32>, %dest : tensor<28x28x15xf32>) -> tensor<28x16x15xf32> {
  %unpack = linalg.unpack %src
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %dest : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 16, 15] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x16x15xf32>
  return %extracted_slice : tensor<28x16x15xf32>
}
