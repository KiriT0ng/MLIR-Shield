#map0 = affine_map<(d0, d1) -> (d0, d1)>
  func.func @fuse_only_as_long_as_result_map_is_permutation(%arg0: tensor<1x1x2x1xf32>, %arg1: tensor<1x1x2x1xf32>) -> tensor<1x1x2x4xf32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<1x2x2x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} outs(%0 : tensor<1x2x2x1xf32>) {
    ^bb0(%out: f32):
      %6 = linalg.index 1 : index
      %7 = linalg.index 2 : index
      %8 = arith.cmpi ult, %6, %c1 : index
      %9 = arith.cmpi ult, %7, %c2 : index
      %10 = arith.andi %8, %9 : i1
      %11 = scf.if %10 -> (f32) {
        %extracted = tensor.extract %arg1[%c0, %6, %7, %c0] : tensor<1x1x2x1xf32>
        scf.yield %extracted : f32
      } else {
        scf.yield %cst : f32
      }
      linalg.yield %11 : f32
    } -> tensor<1x2x2x1xf32>
    %2 = tensor.empty() : tensor<4x1x1x1xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%1 : tensor<1x2x2x1xf32>) outs(%2 : tensor<4x1x1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<4x1x1x1xf32>
    %4 = tensor.empty() : tensor<1x1x2x4xf32>
    %expanded = tensor.expand_shape %4 [[0], [1], [2], [3, 4, 5]] output_shape [1, 1, 2, 4, 1, 1] : tensor<1x1x2x4xf32> into tensor<1x1x2x4x1x1xf32>
    %5 = linalg.generic {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %3 : tensor<1x1x2x1xf32>, tensor<4x1x1x1xf32>) outs(%expanded : tensor<1x1x2x4x1x1xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %6 = arith.mulf %in, %in_0 : f32
      %7 = arith.addf %6, %out : f32
      linalg.yield %7 : f32
    } -> tensor<1x1x2x4x1x1xf32>
    %collapsed = tensor.collapse_shape %5 [[0], [1], [2], [3, 4, 5]] : tensor<1x1x2x4x1x1xf32> into tensor<1x1x2x4xf32>
    return %collapsed : tensor<1x1x2x4xf32>
  }
