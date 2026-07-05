func.func @indexCastFoldVector() -> vector<3xindex> {
  %cst = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %int = arith.index_cast %cst : vector<3xi32> to vector<3xindex>
  return %int : vector<3xindex>
}
