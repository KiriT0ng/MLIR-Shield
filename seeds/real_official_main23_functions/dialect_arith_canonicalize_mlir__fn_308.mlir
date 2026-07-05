func.func @test_flush_denormals_idempotent(%f : f32) -> (f32) {
  %0 = arith.flush_denormals %f : f32
  %1 = arith.flush_denormals %0 : f32
  return %1 : f32
}
