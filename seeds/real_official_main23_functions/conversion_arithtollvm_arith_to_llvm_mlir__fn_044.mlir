func.func @cmpi_2dvector(%arg0 : vector<4x3xi32>, %arg1 : vector<4x3xi32>) {
  %0 = arith.cmpi ult, %arg0, %arg1 : vector<4x3xi32>
  func.return
}
