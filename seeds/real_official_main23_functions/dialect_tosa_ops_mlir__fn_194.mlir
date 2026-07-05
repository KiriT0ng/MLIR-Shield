func.func @test_matmul_t_block_scaled_fp6e2m3_e2e(%arg0: tensor<6x2x32xf32>, %arg1: tensor<6x64x32xf32>) -> tensor<6x2x64xf32> {
  %a, %sa = tosa.cast_to_block_scaled %arg0 {block_size = #tosa.block_size<BLOCK_SIZE_32> : i32} : (tensor<6x2x32xf32>) -> (tensor<6x2x32xf6E2M3FN>, tensor<6x2x1xf8E8M0FNU>)
  %b, %sb = tosa.cast_to_block_scaled %arg1 {block_size = #tosa.block_size<BLOCK_SIZE_32> : i32} : (tensor<6x64x32xf32>) -> (tensor<6x64x32xf6E2M3FN>, tensor<6x64x1xf8E8M0FNU>)
  %res = tosa.matmul_t_block_scaled %a, %sa, %b, %sb {block_size = #tosa.block_size<BLOCK_SIZE_32> : i32} : (tensor<6x2x32xf6E2M3FN>, tensor<6x2x1xf8E8M0FNU>, tensor<6x64x32xf6E2M3FN>, tensor<6x64x1xf8E8M0FNU>) -> tensor<6x2x64xf32>
  return %res : tensor<6x2x64xf32>
}
