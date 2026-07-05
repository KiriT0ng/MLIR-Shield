func.func @inline_forall_loop(%in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (%c0, %c0) to (%c1, %c1)
        step (%c8, %c8) shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %slice = tensor.extract_slice %out_[%i, %j] [2, 3] [1, 1]
      : tensor<8x8xf32> to tensor<2x3xf32>
    %fill = linalg.fill ins(%cst : f32) outs(%slice : tensor<2x3xf32>)
          -> tensor<2x3xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [2, 3] [1, 1]
        : tensor<2x3xf32> into tensor<8x8xf32>
    }
  }
  return %1 : tensor<8x8xf32>
}
