func.func @trunc_handles_small_signed_ranges(%arg0 : i16) -> i1 {
    %c-2_i16 = arith.constant -2 : i16
    %c2_i16 = arith.constant 2 : i16
    %c-2_i8 = arith.constant -2 : i8
    %c2_i8 = arith.constant 2 : i8
    %0 = arith.maxsi %arg0, %c-2_i16 : i16
    %1 = arith.minsi %0, %c2_i16 : i16
    %2 = arith.trunci %1 : i16 to i8
    %3 = arith.cmpi sge, %2, %c-2_i8 : i8
    %4 = arith.cmpi sle, %2, %c2_i8 : i8
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
