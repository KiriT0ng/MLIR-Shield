func.func @cmpi_0dvector(%arg0 : vector<i32>, %arg1 : vector<i32>) {
  %0 = arith.cmpi ult, %arg0, %arg1 : vector<i32>
  func.return
}
