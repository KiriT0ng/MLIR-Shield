module {
  func.func private @dead55()
  func.func @caller55() {
    "orig.wrap"() ({
      func.call @dead55() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
