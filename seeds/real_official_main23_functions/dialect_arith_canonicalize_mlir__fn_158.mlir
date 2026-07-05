func.func @addiMuliToSubiRhsVector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
  %c-1 = arith.constant dense<-1> : vector<3xi64>
  %neg = arith.muli %arg1, %c-1 : vector<3xi64>
  %add = arith.addi %arg0, %neg : vector<3xi64>
  return %add : vector<3xi64>
}
