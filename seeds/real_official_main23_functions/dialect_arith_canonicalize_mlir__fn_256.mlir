func.func @test_mulf2(%arg0 : f32) -> (f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %c0n = arith.constant -0.0 : f32
  %0 = arith.mulf %c0, %arg0 fastmath<nnan,nsz> : f32
  %1 = arith.mulf %c0n, %arg0 fastmath<nnan,nsz> : f32
  return %0, %1 : f32, f32
}
