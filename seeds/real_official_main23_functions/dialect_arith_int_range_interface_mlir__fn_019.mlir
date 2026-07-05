func.func @remui_base_maybe_zero(%arg0 : index, %arg1 : index ) -> i1 {
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index

    %0 = arith.minui %arg1, %c4 : index
    %1 = arith.remui %arg0, %0 : index
    %2 = arith.cmpi ult, %1, %c5 : index
    func.return %2 : i1
}
