func.func @adduiExtendedUnusedOverflowVector(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> vector<3xi32> {
  %sum, %overflow = arith.addui_extended %arg0, %arg1: vector<3xi32>, vector<3xi1>
  return %sum : vector<3xi32>
}
