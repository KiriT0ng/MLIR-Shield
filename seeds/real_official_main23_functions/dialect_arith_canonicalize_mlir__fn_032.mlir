func.func @extUIOfExtUI(%arg0: i1) -> i64 {
  %ext1 = arith.extui %arg0 : i1 to i8
  %ext2 = arith.extui %ext1 : i8 to i64
  return %ext2 : i64
}
