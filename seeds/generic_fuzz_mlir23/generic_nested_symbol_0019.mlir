module {
  func.func private @dead19()
  func.func @caller19() {
    "orig.wrap"() ({
      func.call @dead19() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
