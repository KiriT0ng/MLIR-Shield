func.func @test_cmpf_propagates(%a: f32, %b: f32) -> index {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index

  %0 = arith.cmpf ueq, %a, %b : f32
  %1 = arith.select %0, %c1, %c2 : index
  %2 = test.reflect_bounds %1 : index
  func.return %2 : index
}
