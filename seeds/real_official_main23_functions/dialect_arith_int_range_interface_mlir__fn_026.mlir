func.func @andi(%arg0 : index) -> i1 {
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %c7 = arith.constant 7 : index

    %0 = arith.minsi %arg0, %c5 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.andi %1, %c7 : index
    %3 = arith.cmpi ugt, %2, %c5 : index
    %4 = arith.cmpi ule, %2, %c7 : index
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
