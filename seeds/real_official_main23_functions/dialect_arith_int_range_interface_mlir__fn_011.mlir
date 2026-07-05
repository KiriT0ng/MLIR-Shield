func.func @div_refine_min(%arg0 : index) -> i1 {
    %c0 = arith.constant 1 : index
    %c1 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.andi %arg0, %c1 : index
    %1 = arith.divui %c4, %0 : index
    %2 = arith.cmpi uge, %1, %c0 : index
    func.return %2 : i1
}
