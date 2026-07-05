module {
  func.func @f28() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      "test.term"() : () -> ()
    }) : () -> ()
    return
  }
}
