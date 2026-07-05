#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @fold_fill_generic_mixedaccess(%arg0: tensor<?x?xf32>) -> (tensor<?x?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 0 : index
  %cst1 = arith.constant 7.0 : f32
  %cst2 = arith.constant 6.0 : f32
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %3 = linalg.fill ins(%cst1 : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %4 = tensor.empty(%1, %0) : tensor<?x?xf32>
  %5 = linalg.fill ins(%cst2 : f32) outs(%4 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %6 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %7 = linalg.generic {indexing_maps = [#map0, #map1, #map0], iterator_types=["parallel","parallel"]} ins(%3, %5 : tensor<?x?xf32>, tensor<?x?xf32>) outs (%6:tensor<?x?xf32>) {
  ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
    %8 = arith.divf  %arg1, %arg2 : f32
        linalg.yield %8 : f32
  } -> tensor<?x?xf32>
  return %7 : tensor<?x?xf32>
}
