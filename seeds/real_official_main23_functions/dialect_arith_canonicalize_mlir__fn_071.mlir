func.func @indexCastUIFoldSplatVector() -> vector<3xindex> {
  %cst = arith.constant dense<42> : vector<3xi32>
  %int = arith.index_castui %cst : vector<3xi32> to vector<3xindex>
  return %int : vector<3xindex>
}
