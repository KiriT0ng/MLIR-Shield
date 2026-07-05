func.func @test_reduce_sum(%arg0: tensor<13x21x3xf32>) -> tensor<21x3xf32> {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<13x21x3xf32>) -> tensor<1x21x3xf32>
  %2 = tosa.const_shape {values = dense<[21, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %2 : (tensor<1x21x3xf32>, !tosa.shape<2>) -> tensor<21x3xf32>
  return %1 : tensor<21x3xf32>
}
