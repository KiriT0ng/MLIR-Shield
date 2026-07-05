func.func @extract_slice_rank_reducing_producer(
    %src: tensor<?x?x?x?xf32>, %offset0: index, %offset1: index, %size0: index, %size1: index) -> tensor<8x?xf32> {
  %0 = tensor.extract_slice %src[0, 1, 2, %offset0] [1, 128, 1, %size0] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x?xf32>
  %1 = tensor.extract_slice %0[7, %offset1] [8, %size1] [1, 1] : tensor<128x?xf32> to tensor<8x?xf32>
  return %1: tensor<8x?xf32>
}
