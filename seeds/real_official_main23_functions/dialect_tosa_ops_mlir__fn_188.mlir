func.func @test_matmul_t_block_scaled_fp6e3m2(%arg0: tensor<4x8x32xf6E3M2FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<4x16x32xf6E3M2FN>, %arg3: tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32> {
  %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = #tosa.block_size<BLOCK_SIZE_32>} : (tensor<4x8x32xf6E3M2FN>, tensor<4x8x1xf8E8M0FNU>, tensor<4x16x32xf6E3M2FN>, tensor<4x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
  return %0 : tensor<4x8x16xf32>
}
