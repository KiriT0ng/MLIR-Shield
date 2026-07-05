func.func @test_subf_negzero(%arg0 : f16) -> f16 {
  %c-0 = arith.constant -0.0 : f16
  %0 = arith.subf %c-0, %arg0 : f16
  return %0 : f16
}
