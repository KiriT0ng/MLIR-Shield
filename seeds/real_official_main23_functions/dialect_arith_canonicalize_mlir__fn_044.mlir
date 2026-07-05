func.func @andOfExtUI_nneg_lhs(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.andi %ext0, %ext1 : i64
  return %res : i64
}
