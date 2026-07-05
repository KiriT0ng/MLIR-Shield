module {
  func.func private @dead27()
  func.func @caller27() {
    "orig.wrap"() ({
      func.call @dead27() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
