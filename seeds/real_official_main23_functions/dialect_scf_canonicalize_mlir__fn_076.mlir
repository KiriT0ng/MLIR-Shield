func.func @forall_fold_control_operands(
    %arg0 : tensor<?x10xf32>, %arg1: tensor<?x10xf32>) -> tensor<?x10xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0 = tensor.dim %arg0, %c0 : tensor<?x10xf32>
  %dim1 = tensor.dim %arg0, %c1 : tensor<?x10xf32>

  %result = scf.forall (%i, %j) = (%c0, %c0) to (%dim0, %dim1)
      step (%c1, %c1) shared_outs(%o = %arg1) -> (tensor<?x10xf32>) {
    %slice = tensor.extract_slice %arg1[%i, %j] [1, 1] [1, 1]
      : tensor<?x10xf32> to tensor<1x1xf32>

    scf.forall.in_parallel {
      tensor.parallel_insert_slice %slice into %o[%i, %j] [1, 1] [1, 1]
        : tensor<1x1xf32> into tensor<?x10xf32>
    }
  }

  return %result : tensor<?x10xf32>
}
