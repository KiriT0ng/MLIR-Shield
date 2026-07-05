module {
  func.func @f() {
    "a.b"() ({
      "a.t"() : () -> ()
    }) : () -> ()
    return
  }
}
