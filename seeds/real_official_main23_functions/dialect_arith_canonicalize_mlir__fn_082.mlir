func.func @indexCastOfIndexCast_i8_roundtrip(%arg0: i8) -> i8 {
  %0 = arith.index_cast %arg0 : i8 to index
  %1 = arith.index_cast %0 : index to i8
  return %1 : i8
}
