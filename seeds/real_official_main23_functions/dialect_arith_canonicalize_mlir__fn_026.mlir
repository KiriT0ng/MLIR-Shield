func.func @cmpOfExtSI(%arg0: i1) -> i1 {
  %ext = arith.extsi %arg0 : i1 to i64
  %c0 = arith.constant 0 : i64
  %res = arith.cmpi ne, %ext, %c0 : i64
  return %res : i1
}
