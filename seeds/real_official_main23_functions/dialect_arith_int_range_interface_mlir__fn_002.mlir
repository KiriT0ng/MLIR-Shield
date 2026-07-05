func.func @sub_signed_vs_unsigned(%v : i64) -> i1 {
    %c0 = arith.constant 0 : i64
    %c2 = arith.constant 2 : i64
    %c-5 = arith.constant -5 : i64
    %0 = arith.minsi %v, %c2 : i64
    %1 = arith.maxsi %0, %c-5 : i64
    %2 = arith.subi %1, %c2 : i64
    %3 = arith.cmpi sle, %2, %c0 : i64
    %4 = arith.cmpi ule, %2, %c0 : i64
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
