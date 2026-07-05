func.func @index_cast(%arg0 : index) -> i1 {
    %ci32_smin = arith.constant 0xffffffff80000000 : i64
    %0 = arith.index_cast %arg0 : index to i32
    %1 = arith.index_cast %0 : i32 to index
    %2 = arith.index_cast %ci32_smin : i64 to index
    %3 = arith.cmpi sge, %1, %2 : index
    func.return %3 : i1
}
