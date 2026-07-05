func.func @test_matmul_t_block_scaled_unranked(%arg0: tensor<*xf8E4M3FN>, %arg1: tensor<*xf8E8M0FNU>, %arg2: tensor<*xf8E4M3FN>, %arg3: tensor<*xf8E8M0FNU>) -> tensor<*xf32> {
  %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = #tosa.block_size<BLOCK_SIZE_32>} : (tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>, tensor<*xf8E4M3FN>, tensor<*xf8E8M0FNU>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
