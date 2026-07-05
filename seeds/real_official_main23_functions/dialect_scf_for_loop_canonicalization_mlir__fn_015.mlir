func.func @tensor_dim_of_loop_result(%t : tensor<?x?xf32>) -> index {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c10 = arith.constant 10 : index
  %0 = scf.for %i = %c0 to %c10 step %c1 iter_args(%arg0 = %t)
      -> (tensor<?x?xf32>) {
    scf.yield %arg0 : tensor<?x?xf32>
  }
  %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
  return %dim : index
}
