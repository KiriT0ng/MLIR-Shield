func.func @ind_tensor_extract_slice_rank_mix_333(%arg0: tensor<7x5xf32>) -> tensor<2xf32> {
  %slice = tensor.extract_slice %arg0[1, 0] [1, 2] [1, 1] : tensor<7x5xf32> to tensor<2xf32>
  return %slice : tensor<2xf32>
}
