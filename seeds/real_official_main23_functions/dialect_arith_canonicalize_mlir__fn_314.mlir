func.func @test_remf2() -> (f32, f32) {
  %v1 = arith.constant 3.0 : f32
  %v2 = arith.constant -2.0 : f32
  %v3 = arith.constant -3.0 : f32
  %0 = arith.remf %v1, %v2 : f32
  %1 = arith.remf %v3, %v2 : f32
  return %0, %1 : f32, f32
}
