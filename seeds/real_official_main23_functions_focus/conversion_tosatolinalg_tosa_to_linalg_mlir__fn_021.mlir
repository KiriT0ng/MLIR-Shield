func.func @test_i64(%arg0: tensor<1xi64>) -> () {
  %0 = tosa.clamp %arg0 {min_val = -9223372036854775808 : i64, max_val = 9223372036854775807 : i64} : (tensor<1xi64>) -> tensor<1xi64>

  return
}
