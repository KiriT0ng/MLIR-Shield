func.func @test_intdiv_i64(%arg0: tensor<13x21x1xi64>, %arg1: tensor<13x21x3xi64>) -> tensor<13x21x3xi64> {
  %0 = tosa.intdiv %arg0, %arg1 : (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
  return %0 : tensor<13x21x3xi64>
}
