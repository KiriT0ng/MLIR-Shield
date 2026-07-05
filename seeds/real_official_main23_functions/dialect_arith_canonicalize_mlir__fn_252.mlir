func.func @test_subf_poszero_no_negf(%arg0 : f16) -> f16 {
  %c0 = arith.constant 0.0 : f16
  %0 = arith.subf %c0, %arg0 : f16
  return %0 : f16
}
