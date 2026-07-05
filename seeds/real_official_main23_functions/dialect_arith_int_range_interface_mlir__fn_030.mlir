func.func @xori_i1() -> (i1, i1) {
    %true = arith.constant true
    %1 = test.with_bounds { umin = 0 : i1, umax = 0 : i1, smin = 0 : i1, smax = 0 : i1 } : i1
    %2 = test.with_bounds { umin = 1 : i1, umax = 1 : i1, smin = 1 : i1, smax = 1 : i1 } : i1
    %3 = arith.xori %1, %true : i1
    %4 = arith.xori %2, %true : i1
    func.return %3, %4 : i1, i1
}
