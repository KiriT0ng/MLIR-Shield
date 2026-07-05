func.func @ceil_divsi_intmin_bug_115293() -> i1 {
    %intMin_i64 = test.with_bounds { smin = -9223372036854775808 : si64, smax = -9223372036854775808 : si64, umin = 9223372036854775808 : ui64, umax = 9223372036854775808 : ui64 } : i64
    %denom_i64 = test.with_bounds { smin = 1189465982 : si64, smax = 1189465982 : si64, umin = 1189465982 : ui64, umax = 1189465982 : ui64 } : i64
    %res_i64 = test.with_bounds { smin = 7754212542 : si64, smax = 7754212542 : si64, umin = 7754212542 : ui64, umax = 7754212542 : ui64 }  : i64

    %0 = arith.ceildivsi %intMin_i64, %denom_i64 : i64
    %1 = arith.cmpi eq, %0, %res_i64 : i64
    func.return %1 : i1
}
