func.func @test_andi_not_fold_rhs(%arg0 : index) -> index {
    %0 = arith.constant -1 : index
    %1 = arith.xori %arg0, %0 : index
    %2 = arith.andi %arg0, %1 : index
    return %2 : index
}
