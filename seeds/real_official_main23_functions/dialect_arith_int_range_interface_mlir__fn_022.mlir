func.func @remui_restricted(%arg0 : index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index

    %0 = arith.minui %arg0, %c3 : index
    %1 = arith.maxui %0, %c2 : index
    %2 = arith.remui %1, %c4 : index
    %3 = arith.cmpi ule, %2, %c3 : index
    %4 = arith.cmpi uge, %2, %c2 : index
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
