func.func @remsi_base(%arg0 : index, %arg1 : index ) -> i1 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %c-4 = arith.constant -4 : index
    %true = arith.constant true

    %0 = arith.minsi %arg1, %c4 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.remsi %arg0, %1 : index
    %3 = arith.cmpi sgt, %2, %c-4 : index
    %4 = arith.cmpi slt, %2, %c4 : index
    %5 = arith.cmpi sge, %2, %c0 : index
    %6 = arith.andi %3, %4 : i1
    %7 = arith.andi %5, %6 : i1
    func.return %7 : i1
}
