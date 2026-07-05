module {
  func.func private @dead59()
  func.func @caller59() {
    "orig.wrap"() ({
      func.call @dead59() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
