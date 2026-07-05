func.func @cmpiI1eq(%arg0: i1) -> i1 {
  %one = arith.constant 1 : i1
  %res = arith.cmpi eq, %arg0, %one : i1
  return %res : i1
}
