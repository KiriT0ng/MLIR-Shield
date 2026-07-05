func.func @test_reshape_non_block_scaled_unranked_output(%arg0: tensor<13x21x3xf32>) -> tensor<*xf32> {
  %1 = tosa.const_shape {values = dense<[21, 13, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %0 = tosa.reshape_block_scaled %arg0, %1 {block_size = #tosa.block_size<BLOCK_SIZE_1> : i32} : (tensor<13x21x3xf32>, !tosa.shape<3>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
