// Source: https://github.com/llvm/llvm-project/issues/113021
// Expected trigger: linalg tiling assertion when an indexing map contains a negative multiplicative coefficient.

#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (-d0 + 7)>

func.func @test(%arg0: tensor<8xi8>, %arg1: tensor<8xi8>) -> tensor<8xi8> {
  %0 = linalg.generic {
    indexing_maps = [#map1, #map],
    iterator_types = ["parallel"]}
  ins(%arg0 : tensor<8xi8>)
  outs(%arg1 : tensor<8xi8>) {
  ^bb0(%in: i8, %out: i8):
    linalg.yield %in : i8
  } -> tensor<8xi8>
  return %0 : tensor<8xi8>
}

module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg1: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["linalg.generic"]} in %arg1 : (!transform.any_op) -> !transform.any_op
    %1:2 = transform.structured.tile_using_for
      %0 tile_sizes [2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
    transform.yield
  }
}
