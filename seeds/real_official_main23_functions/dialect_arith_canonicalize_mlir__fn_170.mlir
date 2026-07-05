func.func @adduiExtendedConstantsOverflowVector() -> (vector<4xi32>, vector<4xi1>) {
  %v1 = arith.constant dense<[1, 3, 3, 7]> : vector<4xi32>
  %v2 = arith.constant dense<[0, 3, 4294967295, 7]> : vector<4xi32>
  %sum, %overflow = arith.addui_extended %v1, %v2 : vector<4xi32>, vector<4xi1>
  return %sum, %overflow : vector<4xi32>, vector<4xi1>
}
