func.func @test1(%arg0: i32) -> i1 {
  %cst = arith.constant 0.000000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf ole, %1, %cst : f64
  return %2 : i1
}
