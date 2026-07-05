func.func @andi_doesnt_make_nonnegative(%arg0 : index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.addi %arg0, %c1 : index
    %1 = arith.andi %arg0, %0 : index
    %2 = arith.cmpi sge, %1, %c0 : index
    func.return %2 : i1
}
