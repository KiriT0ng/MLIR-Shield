func.func @sitofpExtui(%arg0: i4) -> bf16 {
  %extui = arith.extui %arg0 : i4 to i8
  %sitofp = arith.sitofp %extui : i8 to bf16
  return %sitofp : bf16
}
