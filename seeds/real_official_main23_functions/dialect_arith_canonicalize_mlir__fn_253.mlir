func.func @test_subf_negzero_splat(%arg0 : vector<4xf32>) -> vector<4xf32> {
  %c-0 = arith.constant dense<-0.0> : vector<4xf32>
  %0 = arith.subf %c-0, %arg0 : vector<4xf32>
  return %0 : vector<4xf32>
}
