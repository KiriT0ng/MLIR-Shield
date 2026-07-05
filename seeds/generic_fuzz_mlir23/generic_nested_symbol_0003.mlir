module {
  func.func private @dead3()
  func.func @caller3() {
    "orig.wrap"() ({
      func.call @dead3() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
