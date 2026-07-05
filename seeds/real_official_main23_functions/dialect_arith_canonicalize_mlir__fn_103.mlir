func.func @sitofpExtui_nneg(%arg0: i4) -> bf16 {
  %extui = arith.extui %arg0 nneg : i4 to i8
  %sitofp = arith.sitofp %extui : i8 to bf16
  return %sitofp : bf16
}
