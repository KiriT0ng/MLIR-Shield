func.func @test_cast_to_block_scaled_unranked(%arg0: tensor<*xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) {
  %0:2 = tosa.cast_to_block_scaled %arg0 {block_size = #tosa.block_size<BLOCK_SIZE_32>} : (tensor<*xf32>) -> (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>)
  return %0#0, %0#1 : tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>
}
