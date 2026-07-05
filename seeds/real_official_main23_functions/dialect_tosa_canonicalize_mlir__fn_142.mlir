func.func @test_canonicalize_cast_from_cast_to_block_scaled_f4E2M1(%arg0: tensor<15x3x2x256xf4E2M1FN>, %arg1: tensor<15x3x2x8xf8E8M0FNU>) -> (tensor<15x3x2x256xf4E2M1FN>, tensor<15x3x2x8xf8E8M0FNU>) {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<15x3x2x256xf4E2M1FN>, tensor<15x3x2x8xf8E8M0FNU>) -> tensor<15x3x2x256xf32>
  %1, %2 = tosa.cast_to_block_scaled %0 {block_size = BLOCK_SIZE_32} : (tensor<15x3x2x256xf32>) -> (tensor<15x3x2x256xf4E2M1FN>, tensor<15x3x2x8xf8E8M0FNU>)
  return %1, %2 : tensor<15x3x2x256xf4E2M1FN>, tensor<15x3x2x8xf8E8M0FNU>
}
