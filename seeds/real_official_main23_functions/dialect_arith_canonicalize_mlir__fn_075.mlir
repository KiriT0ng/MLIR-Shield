func.func @indexCastUIFoldVectorIndexToInt() -> vector<3xi32> {
  %cst = arith.constant dense<[1, 2, 3]> : vector<3xindex>
  %int = arith.index_castui %cst : vector<3xindex> to vector<3xi32>
  return %int : vector<3xi32>
}
