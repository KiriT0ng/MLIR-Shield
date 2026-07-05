func.func @cmpiI1eqLhs(%arg0: i1) -> i1 {
  %one = arith.constant 1 : i1
  %res = arith.cmpi eq, %one, %arg0  : i1
  return %res : i1
}
