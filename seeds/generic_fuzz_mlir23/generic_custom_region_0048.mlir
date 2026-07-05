module {
  func.func @f48() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      
    }) : () -> ()
    return
  }
}
