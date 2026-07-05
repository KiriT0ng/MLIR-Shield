func.func @test_divf1(%arg0 : f32, %arg1 : f32) -> (f32) {
  %0 = arith.negf %arg0 : f32
  %1 = arith.negf %arg1 : f32
  %2 = arith.divf %0, %1 : f32
  return %2 : f32
}
