func.func @extsi(%arg0 : i16) -> i1 {
    %ci16_smax = arith.constant 0x7fff : i32
    %ci16_smin = arith.constant 0xffff8000 : i32
    %0 = arith.extsi %arg0 : i16 to i32
    %1 = arith.cmpi sle, %0, %ci16_smax : i32
    %2 = arith.cmpi sge, %0, %ci16_smin : i32
    %3 = arith.andi %1, %2 : i1
    func.return %3 : i1
}
