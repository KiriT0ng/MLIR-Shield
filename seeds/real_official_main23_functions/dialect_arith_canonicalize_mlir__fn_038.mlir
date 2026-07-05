func.func @cmpIFoldEQ() -> vector<3xi1> {
  %lhs = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %rhs = arith.constant dense<[1, 2, 4]> : vector<3xi32>
  %res = arith.cmpi eq, %lhs, %rhs : vector<3xi32>
  return %res : vector<3xi1>
}
