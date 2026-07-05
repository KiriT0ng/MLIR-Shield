func.func @div_bounds_negative(%arg0 : index) -> i1 {
    %c0 = arith.constant 0 : index
    %c_2 = arith.constant -2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minsi %arg0, %c_2 : index
    %1 = arith.divsi %c4, %0 : index
    %2 = arith.divui %c4, %0 : index

    %3 = arith.cmpi sle, %1, %c0 : index
    %4 = arith.cmpi sge, %1, %c_2 : index
    %5 = arith.cmpi eq, %2, %c0 : index

    %7 = arith.andi %3, %4 : i1
    %8 = arith.andi %7, %5 : i1
    func.return %8 : i1
}
