func.func @test_matmul_t_block_scaled_broadcast(%arg0: tensor<?x8x32xf8E4M3FN>, %arg1: tensor<4x8x1xf8E8M0FNU>, %arg2: tensor<?x16x32xf8E4M3FN>, %arg3: tensor<1x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32> {
  %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = #tosa.block_size<BLOCK_SIZE_32>} : (tensor<?x8x32xf8E4M3FN>, tensor<4x8x1xf8E8M0FNU>, tensor<?x16x32xf8E4M3FN>, tensor<1x16x1xf8E8M0FNU>) -> tensor<4x8x16xf32>
  return %0 : tensor<4x8x16xf32>
}
