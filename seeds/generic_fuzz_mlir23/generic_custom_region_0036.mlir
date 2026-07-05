module {
  func.func @f36() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      
    }) : () -> ()
    return
  }
}
