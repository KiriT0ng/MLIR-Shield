func.func @do_not_inline_distributed_forall_loop(
    %in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (0, 4) to (1, 5) step (8, 8)
      shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %slice = tensor.extract_slice %out_[%i, %j] [2, 3] [1, 1]
      : tensor<8x8xf32> to tensor<2x3xf32>
    %fill = linalg.fill ins(%cst : f32) outs(%slice : tensor<2x3xf32>)
          -> tensor<2x3xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [2, 3] [1, 1]
        : tensor<2x3xf32> into tensor<8x8xf32>
    }
  }{ mapping = [#gpu.thread<y>, #gpu.thread<x>] }
  return %1 : tensor<8x8xf32>
}
