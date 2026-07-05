func.func @test_maxui2(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 255 : i8
  %minIntCst = arith.constant 0 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.maxui %arg0, %arg0 : i8
  %1 = arith.maxui %maxIntCst, %arg0 : i8
  %2 = arith.maxui %minIntCst, %arg0 : i8
  %3 = arith.maxui %c0, %arg0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}
