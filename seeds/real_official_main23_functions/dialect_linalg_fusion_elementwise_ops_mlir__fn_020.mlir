#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @fold_fill_generic_basic(%arg0: tensor<?xf32>) -> (tensor<?xf32>) {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 7.0 : f32
  %0 = tensor.dim %arg0, %c0 : tensor<?xf32>
  %1 = tensor.empty(%0) : tensor<?xf32>
  %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<?xf32>) -> tensor<?xf32>
  %3 = tensor.empty(%0) : tensor<?xf32>
  %4 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types=["parallel"]} ins(%arg0, %2 : tensor<?xf32>, tensor<?xf32>) outs (%3:tensor<?xf32>) {
  ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
    %5 = arith.addf  %arg1, %arg2 : f32
        linalg.yield %5 : f32
  } -> tensor<?xf32>
  return %4 : tensor<?xf32>
}
