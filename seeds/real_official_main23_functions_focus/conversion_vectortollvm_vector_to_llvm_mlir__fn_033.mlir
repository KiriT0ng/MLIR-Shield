func.func @outerproduct_index_scalable(%arg0: vector<2xindex>, %arg1: vector<[3]xindex>) -> vector<2x[3]xindex> {
  %2 = vector.outerproduct %arg0, %arg1 : vector<2xindex>, vector<[3]xindex>
  return %2 : vector<2x[3]xindex>
}
