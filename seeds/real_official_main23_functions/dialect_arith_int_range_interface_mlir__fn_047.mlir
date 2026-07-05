func.func @trunc_respects_same_high_half(%arg0 : i16) -> i1 {
    %c256_i16 = arith.constant 256 : i16
    %c257_i16 = arith.constant 257 : i16
    %c2_i8 = arith.constant 2 : i8
    %0 = arith.maxui %arg0, %c256_i16 : i16
    %1 = arith.minui %0, %c257_i16 : i16
    %2 = arith.trunci %1 : i16 to i8
    %3 = arith.cmpi sge, %2, %c2_i8 : i8
    func.return %3 : i1
}
