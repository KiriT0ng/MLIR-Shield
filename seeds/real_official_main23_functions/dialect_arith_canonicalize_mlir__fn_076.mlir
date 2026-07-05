func.func @indexCastOfIndexCast_lossless(%arg0: i64) -> i64 {
  %0 = arith.index_cast %arg0 : i64 to index
  %1 = arith.index_cast %0 : index to i64
  return %1 : i64
}
