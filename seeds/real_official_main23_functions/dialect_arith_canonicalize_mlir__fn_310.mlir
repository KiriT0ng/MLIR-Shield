func.func @test_remui_1(%arg : vector<4xi32>) -> (vector<4xi32>) {
  %v = arith.constant dense<[1, 1, 1, 1]> : vector<4xi32>
  %0 = arith.remui %arg, %v : vector<4xi32>
  return %0 : vector<4xi32>
}
