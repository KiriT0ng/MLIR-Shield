func.func @inline_empty_loop_with_empty_mapping(
    %in: tensor<16xf32>) -> tensor<16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<16xf32>
  %1 = scf.forall () in () shared_outs (%out_ = %0) -> (tensor<16xf32>) {
    %slice = tensor.extract_slice %out_[0] [16] [1]
      : tensor<16xf32> to tensor<16xf32>
    %generic = linalg.generic {
        indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
        iterator_types = ["parallel"]}
        ins(%slice : tensor<16xf32>) outs(%0 : tensor<16xf32>) {
      ^bb0(%b0 : f32, %b1 : f32):
        %2 = arith.addf %b0, %b0 : f32
        linalg.yield %2 : f32
    } -> tensor<16xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %generic into %out_[0] [16] [1]
        : tensor<16xf32> into tensor<16xf32>
    }
  }{ mapping = [] }
  return %1 : tensor<16xf32>
}
