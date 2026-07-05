func.func @cmpiI1ne(%arg0: i1) -> i1 {
  %zero = arith.constant 0 : i1
  %res = arith.cmpi ne, %arg0, %zero : i1
  return %res : i1
}
