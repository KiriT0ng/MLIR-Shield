func.func @uitofpExtui(%arg0: i8) -> bf16 {
  %extui = arith.extui %arg0 : i8 to i32
  %uitofp = arith.uitofp %extui : i32 to bf16
  return %uitofp : bf16
}
