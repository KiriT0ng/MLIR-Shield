func.func @test_remsi() -> (vector<4xi32>) {
  %v1 = arith.constant dense<[9, 9, 9, 9]> : vector<4xi32>
  %v2 = arith.constant dense<[1, 3, 5, 7]> : vector<4xi32>
  %0 = arith.remsi %v1, %v2 : vector<4xi32>
  return %0 : vector<4xi32>
}
