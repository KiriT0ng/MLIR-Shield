module {
  func.func private @dead35()
  func.func @caller35() {
    "orig.wrap"() ({
      func.call @dead35() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
