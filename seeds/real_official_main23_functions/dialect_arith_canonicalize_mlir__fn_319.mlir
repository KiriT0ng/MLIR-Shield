func.func @test_andi_not_fold_lhs_vec(%arg0 : vector<2xi32>) -> vector<2xi32> {
    %0 = arith.constant dense<[-1, -1]> : vector<2xi32>
    %1 = arith.xori %arg0, %0 : vector<2xi32>
    %2 = arith.andi %1, %arg0 : vector<2xi32>
    return %2 : vector<2xi32>
}
