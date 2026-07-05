func.func @indexCastUIOfIndexCastUI_lossless(%arg0: i64) -> i64 {
  %0 = arith.index_castui %arg0 : i64 to index
  %1 = arith.index_castui %0 : index to i64
  return %1 : i64
}
