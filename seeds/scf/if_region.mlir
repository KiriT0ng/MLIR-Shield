module {
  func.func @select_value(%flag: i1, %a: i32, %b: i32) -> i32 {
    %0 = scf.if %flag -> (i32) {
      scf.yield %a : i32
    } else {
      scf.yield %b : i32
    }
    return %0 : i32
  }
}
