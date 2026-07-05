func.func @add_min_max(%a: index, %b: index) -> index {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = arith.minsi %a, %c1 : index
    %1 = arith.maxsi %0, %c1 : index
    %2 = arith.minui %b, %c2 : index
    %3 = arith.maxui %2, %c2 : index
    %4 = arith.addi %1, %3 : index
    func.return %4 : index
}
