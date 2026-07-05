func.func @test_reshape_block_scaled(%arg0: tensor<4x32xf4E2M1FN>, %arg1: tensor<4x1xf8E8M0FNU>) -> (tensor<2x64xf4E2M1FN>, tensor<2x2xf8E8M0FNU>) {
  %1 = tosa.const_shape {values = dense<[2, 64]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %0:2 = tosa.reshape_block_scaled %arg0, %arg1, %1 {block_size = #tosa.block_size<BLOCK_SIZE_32> : i32} : (tensor<4x32xf4E2M1FN>, tensor<4x1xf8E8M0FNU>, !tosa.shape<2>) -> (tensor<2x64xf4E2M1FN>, tensor<2x2xf8E8M0FNU>)
  return %0#0, %0#1 : tensor<2x64xf4E2M1FN>, tensor<2x2xf8E8M0FNU>
}
