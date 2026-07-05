module {
  func.func @f12() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      
    }) : () -> ()
    return
  }
}
