module {
  func.func private @dead23()
  func.func @caller23() {
    "orig.wrap"() ({
      func.call @dead23() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
