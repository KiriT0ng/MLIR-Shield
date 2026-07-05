func.func @test_flush_denormals_const() -> (f32) {
  %c = arith.constant 1.0e-40 : f32
  %0 = arith.flush_denormals %c : f32
  return %0 : f32
}
