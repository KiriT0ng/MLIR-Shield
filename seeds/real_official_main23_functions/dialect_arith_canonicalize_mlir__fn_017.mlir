func.func @cmpiI1eqVec(%arg0: vector<4xi1>) -> vector<4xi1> {
  %one = arith.constant dense<1> : vector<4xi1>
  %res = arith.cmpi eq, %arg0, %one : vector<4xi1>
  return %res : vector<4xi1>
}
