module {
  func.func @f32() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      "test.term"() : () -> ()
    }) : () -> ()
    return
  }
}
