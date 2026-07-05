module {
  func.func private @dead67()
  func.func @caller67() {
    "orig.wrap"() ({
      func.call @dead67() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
