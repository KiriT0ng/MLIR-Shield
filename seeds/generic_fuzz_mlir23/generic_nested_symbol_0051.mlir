module {
  func.func private @dead51()
  func.func @caller51() {
    "orig.wrap"() ({
      func.call @dead51() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
