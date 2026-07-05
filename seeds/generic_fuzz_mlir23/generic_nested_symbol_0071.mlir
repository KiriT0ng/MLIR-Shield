module {
  func.func private @dead71()
  func.func @caller71() {
    "orig.wrap"() ({
      func.call @dead71() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
