module {
  func.func @f(%arg0: i1) {
    scf.if %arg0 {
      func.call @g() : () -> ()
    }
    return
  }
  func.func @g() {
    return
  }
}
