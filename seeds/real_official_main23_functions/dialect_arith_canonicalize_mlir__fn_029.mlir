func.func @cmpOfExtUIVector(%arg0: vector<4xi1>) -> vector<4xi1> {
  %ext = arith.extui %arg0 : vector<4xi1> to vector<4xi64>
  %c0 = arith.constant dense<0> : vector<4xi64>
  %res = arith.cmpi ne, %ext, %c0 : vector<4xi64>
  return %res : vector<4xi1>
}
