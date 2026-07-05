func.func @orOfOrConstantMultiUse(%arg0: i32) -> (i32, i32) {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %o1 = arith.ori %arg0, %c12 : i32
  %o2 = arith.ori %o1, %c10 : i32
  return %o1, %o2 : i32, i32
}
