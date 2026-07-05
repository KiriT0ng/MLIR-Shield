func.func @for_loop_with_constant_result() -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %0 = scf.for %arg0 = %c0 to %c4 step %c1 iter_args(%arg1 = %true) -> i1 {
        %10 = arith.cmpi ule, %arg0, %c4 : index
        %11 = arith.andi %10, %arg1 : i1
        scf.yield %11 : i1
    }
    func.return %0 : i1
}
