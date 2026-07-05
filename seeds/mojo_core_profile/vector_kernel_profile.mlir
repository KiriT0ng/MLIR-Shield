module {
  func.func @mojo_vector_profile(%arg0: vector<4xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = arith.addf %arg0, %arg1 : vector<4xf32>
    return %0 : vector<4xf32>
  }
}
