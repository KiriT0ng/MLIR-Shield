func.func @div_bounds_positive(%arg0 : index) -> i1 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.maxsi %arg0, %c2 : index
    %1 = arith.divsi %c4, %0 : index
    %2 = arith.divui %c4, %0 : index

    %3 = arith.cmpi sge, %1, %c0 : index
    %4 = arith.cmpi sle, %1, %c2 : index
    %5 = arith.cmpi sge, %2, %c0 : index
    %6 = arith.cmpi sle, %1, %c2 : index

    %7 = arith.andi %3, %4 : i1
    %8 = arith.andi %7, %5 : i1
    %9 = arith.andi %8, %6 : i1
    func.return %9 : i1
}
