func.func @test_minimumf(%arg0 : f32) -> (f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %inf = arith.constant 0x7F800000 : f32
  %0 = arith.minimumf %c0, %arg0 : f32
  %1 = arith.minimumf %arg0, %arg0 : f32
  %2 = arith.minimumf %inf, %arg0 : f32
  return %0, %1, %2 : f32, f32, f32
}
