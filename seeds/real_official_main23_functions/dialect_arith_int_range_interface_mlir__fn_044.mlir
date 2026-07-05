func.func @loop_bound_not_inferred_with_branch(%arg0 : index, %arg1 : i1) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minui %arg0, %c4 : index
    cf.br ^bb2(%c0 : index)
^bb1(%1 : index) :
    %2 = arith.addi %1, %c1 : index
    cf.br ^bb2(%2 : index)
^bb2(%3 : index):
    %4 = arith.cmpi ult, %3, %c4 : index
    cf.cond_br %4, ^bb1(%3 : index), ^bb3(%3 : index)
^bb3(%5 : index) :
    %6 = arith.cmpi sge, %5, %c0 : index
    %7 = arith.cmpi slt, %5, %c4 : index
    %8 = arith.andi %6, %7 : i1
    func.return %8 : i1
}
