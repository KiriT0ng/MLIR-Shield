func.func @fold_multi_use_generic_op_with_consumer(%arg0 : tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<2x3x4xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
  %d2 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
  %empty1 = tensor.empty(%d1, %d2, %d0) : tensor<?x?x?xf32>
  %empty2 = tensor.empty(%d2, %d1, %d0) : tensor<?x?x?xf32>
  %0:2 = linalg.generic {
      iterator_types = ["parallel", "parallel", "parallel"],
      indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d1, d2, d0)>,
                       affine_map<(d0, d1, d2) -> (d2, d1, d0)>]}
      ins(%arg0 : tensor<?x?x?xf32>) outs(%empty1, %empty2 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%b0 : f32, %b1 : f32, %b2 : f32) :
      linalg.yield %b0, %b0 : f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
  %1 = tensor.cast %0#1 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  return %0#0, %1 : tensor<?x?x?xf32>, tensor<2x3x4xf32>
}
