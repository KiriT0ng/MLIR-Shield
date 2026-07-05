func.func @fold_extract_slice_into_unpack_slicing_dim_1(%arg0 : tensor<28x2x1x16x16xf32>) -> tensor<28x17x15xf32> {
  %empty = tensor.empty() : tensor<28x28x15xf32>
  %unpack = linalg.unpack %arg0
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %empty : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 17, 15] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x17x15xf32>
  return %extracted_slice : tensor<28x17x15xf32>
}
