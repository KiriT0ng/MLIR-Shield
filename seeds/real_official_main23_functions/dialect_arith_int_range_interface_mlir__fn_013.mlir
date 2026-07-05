func.func @ceil_divui_by_zero_issue_131273() {
    %0 = test.with_bounds {smax = 0 : i32, smin = -1 : i32, umax = 0 : i32, umin = -1 : i32} : i32
    %c7_i32 = arith.constant 7 : i32
    %1 = arith.ceildivui %c7_i32, %0 : i32
    return
}
