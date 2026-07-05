func.func @extui(%arg0 : i16) -> i1 {
    %ci16_max = arith.constant 0xffff : i32
    %0 = arith.extui %arg0 : i16 to i32
    %1 = arith.cmpi ule, %0, %ci16_max : i32
    func.return %1 : i1
}
