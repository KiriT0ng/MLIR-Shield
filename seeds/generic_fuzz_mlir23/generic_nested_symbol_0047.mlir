module {
  func.func private @dead47()
  func.func @caller47() {
    "orig.wrap"() ({
      func.call @dead47() : () -> ()
      "orig.yield"() : () -> ()
    }) : () -> ()
    return
  }
}
