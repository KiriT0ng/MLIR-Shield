func.func @remove_empty_forall(%in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (%c0, %c16) to (%c1, %c16)
        step (%c8, %c8) shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %fill = linalg.fill ins(%cst : f32) outs(%out_ : tensor<8x8xf32>)
          -> tensor<8x8xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [8, 8] [1, 1]
        : tensor<8x8xf32> into tensor<8x8xf32>
    }
  }
  return %1 : tensor<8x8xf32>
}
