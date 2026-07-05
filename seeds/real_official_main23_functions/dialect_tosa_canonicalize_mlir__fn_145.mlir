func.func @test_do_not_canonicalize_cast_from_cast_to_block_scaled_different_types_f6E2M3_f6E3M2(%arg0: tensor<32xf6E2M3FN>, %arg1: tensor<1xf8E8M0FNU>) -> (tensor<32xf6E3M2FN>, tensor<1xf8E8M0FNU>) {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<32xf6E2M3FN>, tensor<1xf8E8M0FNU>) -> tensor<32xf32>
  %1, %2 = tosa.cast_to_block_scaled %0 {block_size = BLOCK_SIZE_32} : (tensor<32xf32>) -> (tensor<32xf6E3M2FN>, tensor<1xf8E8M0FNU>)
  return %1, %2 : tensor<32xf6E3M2FN>, tensor<1xf8E8M0FNU>
}
