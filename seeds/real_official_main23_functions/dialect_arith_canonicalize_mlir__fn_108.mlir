func.func @truncExtui3_nneg(%arg0: i8) -> i16 {
  %extui = arith.extui %arg0 nneg : i8 to i32
  %trunci = arith.trunci %extui : i32 to i16
  return %trunci : i16
}
