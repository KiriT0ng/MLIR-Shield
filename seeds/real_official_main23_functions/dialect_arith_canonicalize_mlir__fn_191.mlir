func.func @mulsiExtendedOneRhsSplatI1(%arg0: vector<3xi1>) -> (vector<3xi1>, vector<3xi1>) {
  %one = arith.constant dense<true> : vector<3xi1>
  %low, %high = arith.mulsi_extended %arg0, %one: vector<3xi1>
  return %low, %high : vector<3xi1>, vector<3xi1>
}
