func.func @test_reduce_all(%arg0: tensor<13x21x3xi1>) -> tensor<21x3xi1> {
  %0 = tosa.reduce_all %arg0 {axis = 0 : i32} : (tensor<13x21x3xi1>) -> tensor<1x21x3xi1>
  %2 = tosa.const_shape {values = dense<[21, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %2 : (tensor<1x21x3xi1>, !tosa.shape<2>) -> tensor<21x3xi1>
  return %1 : tensor<21x3xi1>
}
