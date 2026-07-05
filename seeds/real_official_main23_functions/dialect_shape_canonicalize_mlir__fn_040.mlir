func.func @cstr_require_fold() {
  %true = arith.constant true
  %0 = shape.cstr_require %true, "msg"
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
