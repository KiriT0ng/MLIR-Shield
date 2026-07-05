func.func @sitofpExtsi(%arg0: i8) -> bf16 {
  %extsi = arith.extsi %arg0 : i8 to i32
  %sitofp = arith.sitofp %extsi : i32 to bf16
  return %sitofp : bf16
}
