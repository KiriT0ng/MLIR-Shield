func.func @ori(%arg0 : i128, %arg1 : i128) -> i1 {
    %c-1 = arith.constant -1 : i128
    %c0 = arith.constant 0 : i128

    %0 = arith.minsi %arg1, %c-1 : i128
    %1 = arith.ori %arg0, %0 : i128
    %2 = arith.cmpi slt, %1, %c0 : i128
    func.return %2 : i1
}
