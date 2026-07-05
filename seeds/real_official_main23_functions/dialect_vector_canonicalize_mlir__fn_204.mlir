func.func @transfer_read_from_rank_reducing_extract_slice(%src: tensor<1x8x8x8xf32>, %i1: index, %i2: index, %i3: index, %i4: index) -> vector<4xf32> {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.000000e+00 : f32
  %0 = tensor.extract_slice %src[0, %i1, %i2, %i3] [1, 4, 1, 4] [1, 1, 1, 1] : tensor<1x8x8x8xf32> to tensor<1x4x4xf32>
  %1 = vector.transfer_read %0[%c0, %i4, %c0], %f0 {in_bounds = [true]} : tensor<1x4x4xf32>, vector<4xf32>
  return %1 : vector<4xf32>
}
