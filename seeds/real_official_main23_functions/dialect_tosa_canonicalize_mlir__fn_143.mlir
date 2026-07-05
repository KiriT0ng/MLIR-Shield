func.func @test_canonicalize_cast_from_cast_to_block_scaled_f8E5M2(%arg0: tensor<160xf8E5M2>, %arg1: tensor<5xf8E8M0FNU>) -> (tensor<160xf8E5M2>, tensor<5xf8E8M0FNU>) {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<160xf8E5M2>, tensor<5xf8E8M0FNU>) -> tensor<160xf32>
  %1, %2 = tosa.cast_to_block_scaled %0 {block_size = BLOCK_SIZE_32} : (tensor<160xf32>) -> (tensor<160xf8E5M2>, tensor<5xf8E8M0FNU>)
  return %1, %2 : tensor<160xf8E5M2>, tensor<5xf8E8M0FNU>
}
