func.func @floor_divsi(%arg0 : index) -> i1 {
    %c4 = arith.constant 4 : index
    %c-1 = arith.constant -1 : index
    %c-3 = arith.constant -3 : index
    %c-4 = arith.constant -4 : index

    %0 = arith.minsi %arg0, %c-1 : index
    %1 = arith.maxsi %0, %c-4 : index
    %2 = arith.floordivsi %1, %c4 : index
    %3 = arith.cmpi eq, %2, %c-1 : index
    func.return %3 : i1
}
