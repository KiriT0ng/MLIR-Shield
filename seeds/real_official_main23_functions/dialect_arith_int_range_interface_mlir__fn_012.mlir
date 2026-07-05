func.func @ceil_divui(%arg0 : index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index

    %0 = arith.minui %arg0, %c3 : index
    %1 = arith.maxui %0, %c1 : index
    %2 = arith.ceildivui %1, %c4 : index
    %3 = arith.cmpi eq, %2, %c1 : index

    %4 = arith.maxui %0, %c0 : index
    %5 = arith.ceildivui %4, %c4 : index
    %6 = arith.cmpi eq, %5, %c1 : index
    %7 = arith.andi %3, %6 : i1
    func.return %7 : i1
}
