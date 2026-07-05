func.func @test_cmpf(%arg0 : f32) -> (i1, i1, i1, i1) {
  %nan = arith.constant 0x7fffffff : f32
  %0 = arith.cmpf olt, %nan, %arg0 : f32
  %1 = arith.cmpf olt, %arg0, %nan : f32
  %2 = arith.cmpf ugt, %nan, %arg0 : f32
  %3 = arith.cmpf ugt, %arg0, %nan : f32
  return %0, %1, %2, %3 : i1, i1, i1, i1
}
