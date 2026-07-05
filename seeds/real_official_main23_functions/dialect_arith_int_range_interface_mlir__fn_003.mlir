func.func @multiply_negatives(%a : index, %b : index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c_1 = arith.constant -1 : index
    %c_2 = arith.constant -2 : index
    %c_4 = arith.constant -4 : index
    %c_12 = arith.constant -12 : index
    %0 = arith.maxsi %a, %c2 : index
    %1 = arith.minsi %0, %c3 : index
    %2 = arith.minsi %b, %c_1 : index
    %3 = arith.maxsi %2, %c_4 : index
    %4 = arith.muli %1, %3 : index
    %5 = arith.cmpi slt, %4, %c_12 : index
    %6 = arith.cmpi slt, %c_1, %4 : index
    %7 = arith.ori %5, %6 : i1
    func.return %7 : i1
}
