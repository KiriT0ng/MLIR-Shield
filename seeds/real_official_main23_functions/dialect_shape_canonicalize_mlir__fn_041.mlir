func.func @cstr_require_no_fold(%arg0: i1) {
  %0 = shape.cstr_require %arg0, "msg"
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
