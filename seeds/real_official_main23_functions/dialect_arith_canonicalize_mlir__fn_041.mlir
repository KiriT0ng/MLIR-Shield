func.func @cmpIFoldULT() -> vector<3xi1> {
  %lhs = arith.constant dense<2> : vector<3xi32>
  %rhs = arith.constant dense<1> : vector<3xi32>
  %res = arith.cmpi ult, %lhs, %rhs : vector<3xi32>
  return %res : vector<3xi1>
}
