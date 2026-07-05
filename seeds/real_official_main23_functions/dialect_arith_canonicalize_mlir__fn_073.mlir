func.func @indexCastUIFoldIndexToInt() -> i32 {
  %c1 = arith.constant 1 : index
  %int = arith.index_castui %c1 : index to i32
  return %int : i32
}
