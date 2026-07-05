func.func @foldSubXX_vector(%static : vector<8xi32>, %dyn : vector<[4]xi32>) -> (vector<8xi32>, vector<[4]xi32>) {
  %static_sub = arith.subi %static, %static : vector<8xi32>
  %dyn_sub = arith.subi %dyn, %dyn : vector<[4]xi32>
  return %static_sub, %dyn_sub : vector<8xi32>, vector<[4]xi32>
}
