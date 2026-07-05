func.func @no_aggressive_eq(%arg0 : index) -> i1 {
    %c1 = arith.constant 1 : index
    %0 = arith.andi %arg0, %c1 : index
    %1 = arith.minui %arg0, %c1 : index
    %2 = arith.cmpi eq, %0, %1 : index
    func.return %2 : i1
}
