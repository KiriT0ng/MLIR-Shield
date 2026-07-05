func.func @unsignedExtendConstant() -> i16 {
  %c2 = arith.constant 2 : i8
  %ext = arith.extui %c2 : i8 to i16
  return %ext : i16
}
