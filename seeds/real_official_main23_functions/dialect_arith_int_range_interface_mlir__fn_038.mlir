func.func @shrsi(%arg0 : i32, %arg1 : i1) -> i1 {
    %c2 = arith.constant 2 : i32
    %c4 = arith.constant 4 : i32
    %c8 = arith.constant 8 : i32
    %c32 = arith.constant 32 : i32
    %c-8 = arith.constant -8 : i32
    %c-32 = arith.constant -32 : i32
    %0 = arith.maxsi %arg0, %c-32 : i32
    %1 = arith.minsi %0, %c32 : i32
    %2 = arith.select %arg1, %c2, %c4 : i32
    %3 = arith.shrsi %1, %2 : i32
    %4 = arith.cmpi sge, %3, %c-8 : i32
    %5 = arith.cmpi sle, %3, %c8 : i32
    %6 = arith.cmpi slt, %3, %c2 : i32
    %7 = arith.andi %4, %5 : i1
    %8 = arith.andi %7, %6 : i1
    func.return %8 : i1
}
