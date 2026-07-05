func.func @orOfExtSI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extsi %arg0 : i8 to i64
  %ext1 = arith.extsi %arg1 : i8 to i64
  %res = arith.ori %ext0, %ext1 : i64
  return %res : i64
}
