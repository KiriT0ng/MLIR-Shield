func.func @indexCastOfIndexCast_3way_lossy(%arg0: i8) -> index {
  %0 = arith.index_cast %arg0 : i8 to index
  %1 = arith.index_cast %0 : index to i64
  %2 = arith.index_cast %1 : i64 to index
  return %2 : index
}
