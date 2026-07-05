func.func @trunc_catches_overflow(%arg0 : i16) -> i1 {
    %c0_i16 = arith.constant 0 : i16
    %c130_i16 = arith.constant 130 : i16
    %c0_i8 = arith.constant 0 : i8
    %0 = arith.maxui %arg0, %c0_i16 : i16
    %1 = arith.minui %0, %c130_i16 : i16
    %2 = arith.trunci %1 : i16 to i8
    %3 = arith.cmpi sge, %2, %c0_i8 : i8
    %4 = arith.cmpi uge, %2, %c0_i8 : i8
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
