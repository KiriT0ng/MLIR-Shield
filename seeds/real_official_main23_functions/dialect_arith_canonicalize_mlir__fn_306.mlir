func.func @test_negf1(%f : f32) -> (f32) {
  %0 = arith.negf %f : f32
  %1 = arith.negf %0 : f32
  return %1: f32
}
