module {
  func.func @f() {
    func.call @g() : () -> ()
    return
  }
  func.func @g() {
    return
  }
}
