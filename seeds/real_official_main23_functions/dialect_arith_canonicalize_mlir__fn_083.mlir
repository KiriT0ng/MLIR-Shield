func.func @indexCastOfIndexCast_vector_lossy(%arg0: vector<3xi128>) -> vector<3xi128> {
  %0 = arith.index_cast %arg0 : vector<3xi128> to vector<3xindex>
  %1 = arith.index_cast %0 : vector<3xindex> to vector<3xi128>
  return %1 : vector<3xi128>
}
