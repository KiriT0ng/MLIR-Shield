func.func @test_cast_from_block_scaled_static(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32> {
  %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = #tosa.block_size<BLOCK_SIZE_32> : i32} : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>) -> tensor<4x32xf32>
  return %0 : tensor<4x32xf32>
}
