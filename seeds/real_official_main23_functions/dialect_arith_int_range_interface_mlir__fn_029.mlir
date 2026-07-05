func.func @xori_issue_82168() -> i1 {
    %c0_i64 = arith.constant 0 : i64
    %c2060639849_i64 = arith.constant 2060639849 : i64
    %2 = test.with_bounds { umin = 2060639849 : i64, umax = 2060639850 : i64, smin = 2060639849 : i64, smax = 2060639850 : i64 } : i64
    %3 = arith.xori %2, %c2060639849_i64 : i64
    %4 = arith.cmpi eq, %3, %c0_i64 : i64
    func.return %4 : i1
}
