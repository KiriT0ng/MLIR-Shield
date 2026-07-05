func.func @ceil_divsi(%arg0 : index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c-4 = arith.constant -4 : index

    %0 = arith.minsi %arg0, %c3 : index
    %1 = arith.maxsi %0, %c1 : index
    %2 = arith.ceildivsi %1, %c4 : index
    %3 = arith.cmpi eq, %2, %c1 : index
    %4 = arith.ceildivsi %1, %c-4 : index
    %5 = arith.cmpi eq, %4, %c0 : index
    %6 = arith.andi %3, %5 : i1

    %7 = arith.maxsi %0, %c0 : index
    %8 = arith.ceildivsi %7, %c4 : index
    %9 = arith.cmpi eq, %8, %c1 : index
    %10 = arith.andi %6, %9 : i1
    func.return %10 : i1
}
