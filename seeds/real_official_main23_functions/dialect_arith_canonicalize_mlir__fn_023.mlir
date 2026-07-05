func.func @cmpiI1neVecLhs(%arg0: vector<4xi1>) -> vector<4xi1> {
  %zero = arith.constant dense<0> : vector<4xi1>
  %res = arith.cmpi ne, %zero, %arg0 : vector<4xi1>
  return %res : vector<4xi1>
}
