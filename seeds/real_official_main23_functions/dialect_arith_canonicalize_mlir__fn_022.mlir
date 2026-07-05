func.func @cmpiI1neLhs(%arg0: i1) -> i1 {
  %zero = arith.constant 0 : i1
  %res = arith.cmpi ne, %zero, %arg0 : i1
  return %res : i1
}
