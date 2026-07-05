func.func @test_cast_to_block_scaled_static(%arg0: tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) {
  %0:2 = tosa.cast_to_block_scaled %arg0 {block_size = #tosa.block_size<BLOCK_SIZE_32>} : (tensor<4x32xf32>) -> (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>)
  return %0#0, %0#1 : tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>
}
