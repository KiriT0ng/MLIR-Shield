func.func @remui_restricted_fails(%arg0 : index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index

    %0 = arith.minui %arg0, %c5 : index
    %1 = arith.maxui %0, %c3 : index
    %2 = arith.remui %1, %c4 : index
    %3 = arith.cmpi ne, %2, %c2 : index
    func.return %3 : i1
}
