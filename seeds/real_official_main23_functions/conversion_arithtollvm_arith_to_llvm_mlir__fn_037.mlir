func.func @addui_extended_vector1d(%arg0: vector<3xi16>, %arg1: vector<3xi16>) -> (vector<3xi16>, vector<3xi1>) {
  %sum, %carry = arith.addui_extended %arg0, %arg1 : vector<3xi16>, vector<3xi1>
  return %sum, %carry : vector<3xi16>, vector<3xi1>
}
