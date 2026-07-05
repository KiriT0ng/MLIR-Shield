func.func @shrui(%arg0 : i1) -> i1 {
    %c2 = arith.constant 2 : i32
    %c4 = arith.constant 4 : i32
    %c8 = arith.constant 8 : i32
    %c32 = arith.constant 32 : i32
    %0 = arith.select %arg0, %c2, %c4 : i32
    %1 = arith.shrui %c32, %0 : i32
    %2 = arith.cmpi ule, %1, %c8 : i32
    %3 = arith.cmpi uge, %1, %c2 : i32
    %4 = arith.cmpi uge, %1, %c8 : i32
    %5 = arith.andi %2, %3 : i1
    %6 = arith.andi %5, %4 : i1
    func.return %6 : i1
}
