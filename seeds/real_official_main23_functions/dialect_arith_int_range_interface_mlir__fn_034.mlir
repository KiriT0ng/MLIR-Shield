func.func @trunci(%arg0 : i32) -> i1 {
    %c-14_i32 = arith.constant -14 : i32
    %c-14_i16 = arith.constant -14 : i16
    %ci16_smin = arith.constant 0xffff8000 : i32
    %0 = arith.minsi %arg0, %c-14_i32 : i32
    %1 = arith.maxsi %0, %ci16_smin : i32
    %2 = arith.trunci %1 : i32 to i16
    %3 = arith.cmpi sle, %2, %c-14_i16 : i16
    %4 = arith.extsi %2 : i16 to i32
    %5 = arith.cmpi sle, %4, %c-14_i32 : i32
    %6 = arith.cmpi sge, %4, %ci16_smin : i32
    %7 = arith.andi %3, %5 : i1
    %8 = arith.andi %7, %6 : i1
    func.return %8 : i1
}
