module {
  func.func @f24() {
    "orig.region"() ({
      "orig.inner"() : () -> ()
      
    }) : () -> ()
    return
  }
}
