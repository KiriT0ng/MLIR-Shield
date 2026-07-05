func.func @remui_base(%arg0 : index, %arg1 : index ) -> i1 {
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index

    %0 = arith.minui %arg1, %c4 : index
    %1 = arith.maxui %0, %c2 : index
    %2 = arith.remui %arg0, %1 : index
    %3 = arith.cmpi ult, %2, %c4 : index
    func.return %3 : i1
}
