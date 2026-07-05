func.func @multiply_unsigned_bounds(%a : i16, %b : i16) -> i1 {
    %c0 = arith.constant 0 : i16
    %c4 = arith.constant 4 : i16
    %c_mask = arith.constant 0x3fff : i16
    %c_bound = arith.constant 0xfffc : i16
    %0 = arith.andi %a, %c_mask : i16
    %1 = arith.minui %b, %c4 : i16
    %2 = arith.muli %0, %1 : i16
    %3 = arith.cmpi uge, %2, %c0 : i16
    %4 = arith.cmpi ule, %2, %c_bound : i16
    %5 = arith.andi %3, %4 : i1
    func.return %5 : i1
}
