module {
  func.func @f() {
    "a.b"() ({
      "a.t"() {callee = @f} : () -> ()
    }) : () -> ()
    return
  }
}
