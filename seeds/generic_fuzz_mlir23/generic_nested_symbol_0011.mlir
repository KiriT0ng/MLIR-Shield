module {
  func.func private @dead11()
  func.func @caller11() {
    "orig.wrap"() ({
      func.call @dead11() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
