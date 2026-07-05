module {
  func.func @f16() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      "test.term"() : () -> ()
    }) : () -> ()
    return
  }
}
