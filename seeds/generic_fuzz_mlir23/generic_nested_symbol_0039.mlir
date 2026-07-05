module {
  func.func private @dead39()
  func.func @caller39() {
    "orig.wrap"() ({
      func.call @dead39() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
