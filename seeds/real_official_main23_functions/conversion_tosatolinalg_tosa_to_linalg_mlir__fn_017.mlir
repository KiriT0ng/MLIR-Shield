func.func @test_simple_ui8(%arg0: tensor<1xui8>) -> () {
  %0 = tosa.cast %arg0 : (tensor<1xui8>) -> tensor<1xf32>
  return
}
