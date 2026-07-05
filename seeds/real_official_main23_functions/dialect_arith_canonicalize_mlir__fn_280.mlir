func.func @constant_SItoFP_vector() -> vector<4xf32> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi32>
  %res = arith.sitofp %vector : vector<4xi32> to vector<4xf32>
  return %res : vector<4xf32>
}
