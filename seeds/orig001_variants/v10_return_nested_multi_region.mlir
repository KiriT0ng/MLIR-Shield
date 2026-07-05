module {
  func.func @f() {
    "a.b"() ({
      "a.t0"() : () -> ()
    }, {
      "a.t1"() : () -> ()
    }) : () -> ()
    return
  }
}
