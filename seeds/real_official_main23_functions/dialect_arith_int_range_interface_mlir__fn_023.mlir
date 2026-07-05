func.func @remsi_restricted(%arg0 : index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c-4 = arith.constant -4 : index

    %0 = arith.minsi %arg0, %c3 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.remsi %1, %c-4 : index
    %3 = arith.cmpi ule, %2, %c3 : index
    %4 = arith.cmpi uge, %2, %c2 : index
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
