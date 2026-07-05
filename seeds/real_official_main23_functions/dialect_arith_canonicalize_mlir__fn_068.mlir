func.func @indexCastFoldSplatVectorIndexToInt() -> vector<3xi32> {
  %cst = arith.constant dense<42> : vector<3xindex>
  %int = arith.index_cast %cst : vector<3xindex> to vector<3xi32>
  return %int : vector<3xi32>
}
