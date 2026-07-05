module {
  func.func private @dead75()
  func.func @caller75() {
    "orig.wrap"() ({
      func.call @dead75() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
