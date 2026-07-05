func.func @test_maximumf(%arg0 : f32) -> (f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %-inf = arith.constant 0xFF800000 : f32
  %0 = arith.maximumf %c0, %arg0 : f32
  %1 = arith.maximumf %arg0, %arg0 : f32
  %2 = arith.maximumf %-inf, %arg0 : f32
  return %0, %1, %2 : f32, f32, f32
}
