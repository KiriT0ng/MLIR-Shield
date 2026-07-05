module {
  func.func private @dead31()
  func.func @caller31() {
    "orig.wrap"() ({
      func.call @dead31() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
