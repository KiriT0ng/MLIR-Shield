func.func @test_argmax(%arg0: tensor<14x19xf32>) -> tensor<14xi32> {
  %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<14x19xf32>) -> tensor<14xi32>
  return %0 : tensor<14xi32>
}
