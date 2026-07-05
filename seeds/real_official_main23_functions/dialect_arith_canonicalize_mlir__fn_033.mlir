func.func @extSIOfExtSI(%arg0: i1) -> i64 {
  %ext1 = arith.extsi %arg0 : i1 to i8
  %ext2 = arith.extsi %ext1 : i8 to i64
  return %ext2 : i64
}
