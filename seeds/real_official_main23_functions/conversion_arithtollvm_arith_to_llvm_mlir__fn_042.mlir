func.func @cmpf_2dvector(%arg0 : vector<4x3xf32>, %arg1 : vector<4x3xf32>) {
  %0 = arith.cmpf olt, %arg0, %arg1 : vector<4x3xf32>
  func.return
}
