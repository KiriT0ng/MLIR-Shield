func.func @truncation_spillover(%arg0 : memref<?xi32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c49 = arith.constant 49 : index
    %0 = scf.for %arg1 = %c0 to %c2 step %c1 iter_args(%arg2 = %c0) -> index {
        %1 = arith.divsi %arg2, %c49 : index
        %2 = arith.index_cast %1 : index to i32
        memref.store %2, %arg0[%c0] : memref<?xi32>
        %3 = arith.addi %arg2, %arg1 : index
        scf.yield %3 : index
    }
  func.return %0 : index
}
