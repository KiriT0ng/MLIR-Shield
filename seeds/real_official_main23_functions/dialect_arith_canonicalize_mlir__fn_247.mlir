func.func @test_minnumf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %inf = arith.constant 0x7F800000 : f32
  %nan = arith.constant 0x7FC00000 : f32
  %0 = arith.minnumf %c0, %arg0 : f32
  %1 = arith.minnumf %arg0, %arg0 : f32
  %2 = arith.minnumf %inf, %arg0 : f32
  %3 = arith.minnumf %nan, %arg0 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}
