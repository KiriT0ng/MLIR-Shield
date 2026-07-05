func.func @test_simple_f16(%arg0: tensor<1xf16>) -> () {

  %0 = tosa.cast %arg0 : (tensor<1xf16>) -> tensor<1xf32>

  %1 = "tosa.cast"(%arg0) : (tensor<1xf16>) -> tensor<1xi8>

  %2 = "tosa.cast"(%arg0) : (tensor<1xf16>) -> tensor<1xi32>
  return
}
