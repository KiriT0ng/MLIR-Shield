func.func @indexCastUIFold() -> index {
  %c-2 = arith.constant -2 : i8
  %idx = arith.index_castui %c-2 : i8 to index
  return %idx : index
}
