func.func @tensor_dim_of_iter_arg_nested_for(%t : tensor<?x?xf32>,
                                        %t2 : tensor<10x10xf32>) -> index {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c10 = arith.constant 10 : index
  %0, %1 = scf.for %i = %c0 to %c10 step %c1 iter_args(%arg0 = %t, %arg1 = %c0)
      -> (tensor<?x?xf32>, index) {
    %2, %3 = scf.for %j = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0, %arg3 = %arg1)
        -> (tensor<?x?xf32>, index) {
      %dim = tensor.dim %arg2, %c0 : tensor<?x?xf32>
      %4 = tensor.insert_slice %t2 into %arg2[0, 0] [10, 10] [1, 1]
          : tensor<10x10xf32> into tensor<?x?xf32>
      scf.yield %4, %dim : tensor<?x?xf32>, index
    }
    scf.yield %2, %3 : tensor<?x?xf32>, index
  }
  return %1 : index
}
