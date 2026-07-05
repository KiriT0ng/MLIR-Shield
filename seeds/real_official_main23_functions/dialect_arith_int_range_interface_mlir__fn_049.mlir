func.func @extui_uses_unsigned(%arg0 : i32) -> i1 {
    %ci32_smin = arith.constant 0x80000000 : i32
    %ci32_smin_64 = arith.constant 0x80000000 : i64
    %c0_i64 = arith.constant 0 : i64
    %0 = arith.minui %arg0, %ci32_smin : i32
    %1 = arith.extui %0 : i32 to i64
    %2 = arith.cmpi sge, %1, %c0_i64 : i64
    %3 = arith.cmpi ule, %1, %ci32_smin_64 : i64
    %4 = arith.andi %2, %3 : i1
    func.return %4 : i1
}
