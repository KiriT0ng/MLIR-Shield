module {
  func.func private @dead63()
  func.func @caller63() {
    "orig.wrap"() ({
      func.call @dead63() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
