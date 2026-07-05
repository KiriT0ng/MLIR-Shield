func.func @for_loop_with_increasing_arg() -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %0 = scf.for %arg0 = %c0 to %c4 step %c1 iter_args(%arg1 = %c0) -> index {
        %10 = arith.addi %arg0, %arg1 : index
        scf.yield %10 : index
    }
    %1 = arith.cmpi ule, %0, %c16 : index
    func.return %1 : i1
}
