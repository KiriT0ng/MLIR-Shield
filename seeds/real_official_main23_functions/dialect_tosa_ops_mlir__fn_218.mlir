func.func @test_conv2d_block_scaled_static(%arg0: tensor<1x4x4x64xf4E2M1FN>, %arg1: tensor<1x4x4x2xf8E8M0FNU>, %arg2: tensor<8x1x1x64xf4E2M1FN>, %arg3: tensor<8x1x1x2xf8E8M0FNU>, %arg4: tensor<1xf32>) -> tensor<*xf32> {
  %0 = tosa.const_shape {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %1 = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %2 = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %3 = tosa.conv2d_block_scaled %arg0, %arg1, %arg2, %arg3, %arg4, %0, %1, %2 {block_size = BLOCK_SIZE_32} : (tensor<1x4x4x64xf4E2M1FN>, tensor<1x4x4x2xf8E8M0FNU>, tensor<8x1x1x64xf4E2M1FN>, tensor<8x1x1x2xf8E8M0FNU>, tensor<1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<*xf32>
  return %3 : tensor<*xf32>
}
