module {
  func.func @f40() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      "test.term"() : () -> ()
    }) : () -> ()
    return
  }
}
