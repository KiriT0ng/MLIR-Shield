func.func private @foo()->()
  func.func @no_inline_execute_region_not_canonicalized() {
    %c = arith.constant 42 : i32
    %v = scf.execute_region -> i32 no_inline {
      func.call @foo():()->()
      scf.yield %c : i32
    }
    return
  }
