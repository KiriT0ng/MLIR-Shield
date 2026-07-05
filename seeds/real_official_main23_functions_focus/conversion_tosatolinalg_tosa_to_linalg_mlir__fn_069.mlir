func.func @test_dynamic_rfft2d(%arg0: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
  %output_real, %output_imag = "tosa.rfft2d"(%arg0) {} : (tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
  return %output_real, %output_imag : tensor<?x?x?xf32>, tensor<?x?x?xf32>
}
