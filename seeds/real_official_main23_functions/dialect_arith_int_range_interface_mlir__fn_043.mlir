func.func @branch_union(%arg0 : index, %arg1 : i1) -> i1 {
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %c-1 = arith.constant -1 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minui %arg0, %c4 : index
    cf.cond_br %arg1, ^bb1, ^bb2
^bb1 :
    %1 = arith.muli %0, %0 : index
    cf.br ^bb3(%1 : index)
^bb2 :
    %2 = arith.muli %0, %c-1 : index
    cf.br ^bb3(%2 : index)
^bb3(%3 : index) :
    %4 = arith.cmpi sle, %3, %c16 : index
    %5 = arith.cmpi sge, %3, %c-4 : index
    %6 = arith.andi %4, %5 : i1
    func.return %6 : i1
}
