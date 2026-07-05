func.func @indexCastFold() -> index {
  %c-2 = arith.constant -2 : i8
  %idx = arith.index_cast %c-2 : i8 to index
  return %idx : index
}
