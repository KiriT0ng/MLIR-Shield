func.func @test_mulf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c1 = arith.constant 1.0 : f32
  %c2 = arith.constant 2.0 : f32
  %0 = arith.mulf %c2, %arg0 : f32
  %1 = arith.mulf %arg0, %c1 : f32
  %2 = arith.mulf %c1, %arg0 : f32
  %3 = arith.mulf %c2, %c2 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}
