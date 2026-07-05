module {
  func.func @f72() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      
    }) : () -> ()
    return
  }
}
