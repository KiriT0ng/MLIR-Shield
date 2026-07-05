func.func @test_maxsi2(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 127 : i8
  %minIntCst = arith.constant -128 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.maxsi %arg0, %arg0 : i8
  %1 = arith.maxsi %maxIntCst, %arg0: i8
  %2 = arith.maxsi %minIntCst, %arg0: i8
  %3 = arith.maxsi %c0, %arg0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}
