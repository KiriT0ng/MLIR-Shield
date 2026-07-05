func.func @indexCastOfIndexCast_lossy(%arg0: index) -> index {
  %0 = arith.index_cast %arg0 : index to i8
  %1 = arith.index_cast %0 : i8 to index
  return %1 : index
}
