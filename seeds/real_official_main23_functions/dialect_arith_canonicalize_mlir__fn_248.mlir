func.func @test_maxnumf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %-inf = arith.constant 0xFF800000 : f32
  %nan = arith.constant 0x7FC00000 : f32
  %0 = arith.maxnumf %c0, %arg0 : f32
  %1 = arith.maxnumf %arg0, %arg0 : f32
  %2 = arith.maxnumf %-inf, %arg0 : f32
  %3 = arith.maxnumf %nan, %arg0 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}
