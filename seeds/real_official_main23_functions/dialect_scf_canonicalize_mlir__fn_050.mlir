func.func @while_loop_invariant_argument_different_order(%arg : tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
  %cst_0 = arith.constant dense<0> : tensor<i32>
  %cst_1 = arith.constant dense<1> : tensor<i32>
  %cst_42 = arith.constant dense<42> : tensor<i32>

  %0:6 = scf.while (%arg0 = %cst_0, %arg1 = %cst_1, %arg2 = %cst_1, %arg3 = %cst_1, %arg4 = %cst_0) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
    %1 = arith.cmpi slt, %arg0, %arg : tensor<i32>
    %2 = tensor.extract %1[] : tensor<i1>
    scf.condition(%2) %arg1, %arg0, %arg2, %arg0, %arg3, %arg4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  } do {
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<i32>, %arg5: tensor<i32>): // no predecessors
    %1 = arith.addi %arg0, %cst_1 : tensor<i32>
    %2 = arith.addi %arg2, %arg3 : tensor<i32>
    scf.yield %arg3, %arg1, %2, %2, %arg4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  }
  return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
}
