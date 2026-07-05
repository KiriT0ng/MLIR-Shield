func.func @add_lower_bound(%a : i32, %b : i32) -> i1 {
    %c1 = arith.constant 1 : i32
    %c2 = arith.constant 2 : i32
    %0 = arith.maxsi %a, %c1 : i32
    %1 = arith.maxsi %b, %c1 : i32
    %2 = arith.addi %0, %1 : i32
    %3 = arith.cmpi sge, %2, %c2 : i32
    %4 = arith.cmpi uge, %2, %c2 : i32
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
