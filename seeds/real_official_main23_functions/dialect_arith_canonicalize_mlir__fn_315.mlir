func.func @test_remf_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, -3.0, 4.0]> : vector<4xf32>
  %v2 = arith.constant dense<[2.0, 2.0, 2.0, 2.0]> : vector<4xf32>
  %0 = arith.remf %v1, %v2 : vector<4xf32>
  return %0 : vector<4xf32>
}
