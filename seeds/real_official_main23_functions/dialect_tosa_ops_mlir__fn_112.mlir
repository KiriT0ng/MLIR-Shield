func.func @test_reverse_unranked(%arg0: tensor<*xf32>) -> tensor<*xf32> {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<*xf32>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
