func.func @cmpiI1neVec(%arg0: vector<4xi1>) -> vector<4xi1> {
  %zero = arith.constant dense<0> : vector<4xi1>
  %res = arith.cmpi ne, %arg0, %zero : vector<4xi1>
  return %res : vector<4xi1>
}
