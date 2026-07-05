func.func @test_cast_fp32_i64(%arg0: tensor<1xf32>) -> (tensor<1xi64>) {
  %0 = tosa.cast %arg0 : (tensor<1xf32>) -> tensor<1xi64>
  return %0: tensor<1xi64>
}
