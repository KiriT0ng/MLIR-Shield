module {
  func.func private @dead7()
  func.func @caller7() {
    "orig.wrap"() ({
      func.call @dead7() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
