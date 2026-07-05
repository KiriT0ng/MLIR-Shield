func.func @truncExtsi3(%arg0: i8) -> i16 {
  %extsi = arith.extsi %arg0 : i8 to i32
  %trunci = arith.trunci %extsi : i32 to i16
  return %trunci : i16
}
