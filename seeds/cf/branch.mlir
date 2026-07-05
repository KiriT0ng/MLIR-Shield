module {
  func.func @branch(%flag: i1) -> i32 {
    %zero = arith.constant 0 : i32
    %one = arith.constant 1 : i32
    cf.cond_br %flag, ^true_block, ^false_block
  ^true_block:
    return %one : i32
  ^false_block:
    return %zero : i32
  }
}
