func.func @test_cast_from_block_scaled_unranked(%arg0: tensor<*xf4E2M1FN>, %arg1: tensor<*xf8E8M0FNU>) -> tensor<*xf32> {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = #tosa.block_size<BLOCK_SIZE_32> : i32} : (tensor<*xf4E2M1FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
