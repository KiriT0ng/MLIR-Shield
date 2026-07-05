// Source: https://github.com/llvm/llvm-project/issues/60210
// Expected trigger: test-transform-dialect-interpreter assertion while tiling a linalg reduction.
// Reported command: mlir-opt --test-transform-dialect-interpreter temp.mlir

#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @func(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {
      indexing_maps = [#map, #map1],
      iterator_types = ["parallel", "reduction"]
    } ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = llvm.fmul %in, %in : f32
      %2 = llvm.fadd %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  transform.sequence failures(propagate) {
  ^bb0(%arg0: !pdl.operation):
    %0 = transform.structured.match ops{["linalg.generic"]} in %arg0
    %for_op, %fill_op, %split_linalg_op, %combining_linalg_op =
      transform.structured.tile_reduction_using_scf %0 by tile_sizes = [0, 5]
  }
}
