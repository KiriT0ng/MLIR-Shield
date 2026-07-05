module {
  func.func private @dead79()
  func.func @caller79() {
    "orig.wrap"() ({
      func.call @dead79() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
