func.func @mulsiExtendedScalarConstants() -> (i8, i8) {
  %c57 = arith.constant 57 : i8
  %c_n13 = arith.constant -13 : i8
  %low, %high = arith.mulsi_extended %c57, %c_n13: i8
  return %low, %high : i8, i8
}
