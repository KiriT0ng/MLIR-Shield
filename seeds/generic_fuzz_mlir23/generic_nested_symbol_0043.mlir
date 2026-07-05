module {
  func.func private @dead43()
  func.func @caller43() {
    "orig.wrap"() ({
      func.call @dead43() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
