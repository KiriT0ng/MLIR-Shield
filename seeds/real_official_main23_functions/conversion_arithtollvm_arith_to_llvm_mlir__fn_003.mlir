func.func @vector_index_cast(%arg0: vector<2xindex>, %arg1: vector<2xi1>) {
  %0 = arith.index_cast %arg0: vector<2xindex> to vector<2xi1>
  %1 = arith.index_cast %arg1: vector<2xi1> to vector<2xindex>
  return
}
