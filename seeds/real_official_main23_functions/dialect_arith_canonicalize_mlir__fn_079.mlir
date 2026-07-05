func.func @indexCastUIOfIndexCastUI_lossy(%arg0: index) -> index {
  %0 = arith.index_castui %arg0 : index to i8
  %1 = arith.index_castui %0 : i8 to index
  return %1 : index
}
