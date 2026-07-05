func.func @test6(%arg0: i32) -> i1 {
  %cst = arith.constant -4.400000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf olt, %1, %cst : f64
  return %2 : i1
}
