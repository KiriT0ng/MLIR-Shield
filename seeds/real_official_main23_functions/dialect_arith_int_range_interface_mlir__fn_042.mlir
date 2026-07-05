func.func @if_union(%arg0 : index, %arg1 : i1) -> i1 {
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %c-1 = arith.constant -1 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minui %arg0, %c4 : index
    %1 = scf.if %arg1 -> index {
        %10 = arith.muli %0, %0 : index
        scf.yield %10 : index
    } else {
        %20 = arith.muli %0, %c-1 : index
        scf.yield %20 : index
    }
    %2 = arith.cmpi sle, %1, %c16 : index
    %3 = arith.cmpi sge, %1, %c-4 : index
    %4 = arith.andi %2, %3 : i1
    func.return %4 : i1
}
