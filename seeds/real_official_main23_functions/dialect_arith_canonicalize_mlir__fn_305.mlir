func.func @test_negf() -> (f32) {
  %c = arith.constant 2.0 : f32
  %0 = arith.negf %c : f32
  return %0: f32
}
