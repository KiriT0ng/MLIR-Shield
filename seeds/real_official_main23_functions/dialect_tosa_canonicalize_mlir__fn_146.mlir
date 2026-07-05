func.func @test_do_not_canonicalize_cast_from_cast_to_block_scaled_unranked(%arg0: tensor<3x64xf6E2M3FN>, %arg1: tensor<3x2xf8E8M0FNU>) -> (tensor<*xf6E2M3FN>, tensor<*xf8E8M0FNU>) {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<3x64xf6E2M3FN>, tensor<3x2xf8E8M0FNU>) -> tensor<*xf32>
  %1, %2 = tosa.cast_to_block_scaled %0 {block_size = BLOCK_SIZE_32} : (tensor<*xf32>) -> (tensor<*xf6E2M3FN>, tensor<*xf8E8M0FNU>)
  return %1, %2 : tensor<*xf6E2M3FN>, tensor<*xf8E8M0FNU>
}
