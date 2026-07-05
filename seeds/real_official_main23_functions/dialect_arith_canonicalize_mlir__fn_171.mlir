func.func @adduiExtendedConstantsSplatVector() -> (vector<4xi32>, vector<4xi1>) {
  %v1 = arith.constant dense<1> : vector<4xi32>
  %v2 = arith.constant dense<2> : vector<4xi32>
  %sum, %overflow = arith.addui_extended %v1, %v2 : vector<4xi32>, vector<4xi1>
  return %sum, %overflow : vector<4xi32>, vector<4xi1>
}
