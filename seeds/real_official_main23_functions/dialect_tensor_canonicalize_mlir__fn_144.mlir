func.func @dim_of_reshape_for( %arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index

    %0 = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>

    %1 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %c1) -> (index) {
      %2 = tensor.dim %0, %arg2 : tensor<*xf32>
      %3 = arith.muli %arg3, %2 : index
      scf.yield %3 : index
    }
    return %1 : index
}
