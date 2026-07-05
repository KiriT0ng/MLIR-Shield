func.func @indexCastUIOfIndexCastUI_3way_lossy(%arg0: i64) -> index {
  %0 = arith.index_castui %arg0 : i64 to index
  %1 = arith.index_castui %0 : index to i8
  %2 = arith.index_castui %1 : i8 to index
  return %2 : index
}
