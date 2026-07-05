func.func @indirect_const_call(%arg0: i32) {
  %0 = constant @body : (i32) -> ()
  call_indirect %0(%arg0) : (i32) -> ()
  return
}
