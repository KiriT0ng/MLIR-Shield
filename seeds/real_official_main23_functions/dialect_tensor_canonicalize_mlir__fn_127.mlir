func.func @cast_extract_slice_rank_reduce(%arg0 : tensor<128x512xf32>, %s : index, %o : index)
    -> tensor<16xf32> {
  %0 = tensor.extract_slice %arg0[%o, 0] [%s, 1] [1, 1] : tensor<128x512xf32> to tensor<?xf32>
  %1 = tensor.cast %0 : tensor<?xf32> to tensor<16xf32>
  return %1 : tensor<16xf32>
}
