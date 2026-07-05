func.func @muluiExtendedScalarConstants() -> (i8, i8) {
  %c57 = arith.constant 57 : i8
  %c133 = arith.constant 133 : i8
  %low, %high = arith.mului_extended %c57, %c133: i8 // = 7581
  return %low, %high : i8, i8
}
