module {
  func.func private @dead15()
  func.func @caller15() {
    "orig.wrap"() ({
      func.call @dead15() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
