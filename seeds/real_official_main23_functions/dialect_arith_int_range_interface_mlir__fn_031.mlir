func.func @xori(%arg0 : i64, %arg1 : i64) -> i1 {
    %c0 = arith.constant 0 : i64
    %c7 = arith.constant 7 : i64
    %c15 = arith.constant 15 : i64
    %true = arith.constant true

    %0 = arith.minui %arg0, %c7 : i64
    %1 = arith.minui %arg1, %c15 : i64
    %2 = arith.xori %0, %1 : i64
    %3 = arith.cmpi sle, %2, %c15 : i64
    %4 = arith.xori %3, %true : i1
    func.return %4 : i1
}
