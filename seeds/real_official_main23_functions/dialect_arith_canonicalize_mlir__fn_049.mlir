func.func @orOfExtUI_nneg_both(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 nneg : i8 to i64
  %res = arith.ori %ext0, %ext1 : i64
  return %res : i64
}
