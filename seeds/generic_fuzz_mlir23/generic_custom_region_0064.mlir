module {
  func.func @f64() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      "test.term"() : () -> ()
    }) : () -> ()
    return
  }
}
