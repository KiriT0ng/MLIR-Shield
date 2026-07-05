func.func @test_reshape_non_block_scaled(%arg0: tensor<13x21x3xf32>) -> tensor<1x819xf32> {
  %1 = tosa.const_shape {values = dense<[1, 819]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %0 = tosa.reshape_block_scaled %arg0, %1 {block_size = #tosa.block_size<BLOCK_SIZE_1> : i32} : (tensor<13x21x3xf32>, !tosa.shape<2>) -> tensor<1x819xf32>
  return %0 : tensor<1x819xf32>
}
