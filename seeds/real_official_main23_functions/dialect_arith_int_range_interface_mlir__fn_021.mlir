func.func @remsi_positive(%arg0 : index, %arg1 : index ) -> i1 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %true = arith.constant true

    %0 = arith.minsi %arg1, %c4 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.maxsi %arg0, %c0 : index
    %3 = arith.remsi %2, %1 : index
    %4 = arith.cmpi sge, %3, %c0 : index
    %5 = arith.cmpi slt, %3, %c4 : index
    %6 = arith.andi %4, %5 : i1
    func.return %6 : i1
}
