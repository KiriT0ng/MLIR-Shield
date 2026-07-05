func.func @test_addf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %c-0 = arith.constant -0.0 : f32
  %c1 = arith.constant 1.0 : f32
  %0 = arith.addf %c0, %arg0 : f32
  %1 = arith.addf %arg0, %c-0 : f32
  %2 = arith.addf %c-0, %arg0 : f32
  %3 = arith.addf %c1, %c1 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}
