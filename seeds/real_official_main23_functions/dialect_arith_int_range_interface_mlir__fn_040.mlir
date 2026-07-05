func.func @select_union(%arg0 : index, %arg1 : i1) -> i1 {
    %c64 = arith.constant 64 : index
    %c100 = arith.constant 100 : index
    %c128 = arith.constant 128 : index
    %c192 = arith.constant 192 : index
    %0 = arith.remui %arg0, %c64 : index
    %1 = arith.addi %0, %c128 : index
    %2 = arith.select %arg1, %0, %1 : index
    %3 = arith.cmpi slt, %2, %c192 : index
    %4 = arith.cmpi ne, %c100, %2 : index
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
