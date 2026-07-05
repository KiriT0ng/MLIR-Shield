func.func @index_vector(%arg0: vector<4xindex>) {
  %0 = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
  %1 = arith.addi %arg0, %0 : vector<4xindex>
  func.return
}
