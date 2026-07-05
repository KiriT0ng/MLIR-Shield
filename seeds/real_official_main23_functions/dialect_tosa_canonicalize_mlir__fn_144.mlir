func.func @test_do_not_canonicalize_cast_from_cast_to_block_scaled_different_types_f8E5M2_f6E2M3(%arg0: tensor<160xf8E5M2>, %arg1: tensor<5xf8E8M0FNU>) -> (tensor<160xf6E2M3FN>, tensor<5xf8E8M0FNU>) {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<160xf8E5M2>, tensor<5xf8E8M0FNU>) -> tensor<160xf32>
  %1, %2 = tosa.cast_to_block_scaled %0 {block_size = BLOCK_SIZE_32} : (tensor<160xf32>) -> (tensor<160xf6E2M3FN>, tensor<5xf8E8M0FNU>)
  return %1, %2 : tensor<160xf6E2M3FN>, tensor<5xf8E8M0FNU>
}
