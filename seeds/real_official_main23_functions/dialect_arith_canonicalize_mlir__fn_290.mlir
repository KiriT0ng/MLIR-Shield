func.func @test7(%arg0: i32) -> i1 {
  %cst = arith.constant 3.200000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf oge, %1, %cst : f64
  return %2 : i1
}
