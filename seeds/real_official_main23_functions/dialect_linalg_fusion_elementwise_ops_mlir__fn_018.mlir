#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @fusion_different_axes(%arg0 : tensor<5000xi64>, %arg1 : tensor<5000xi32>) -> tensor<5000xi32> {
  %c1_i32 = arith.constant 1 : i32
  %0 = linalg.generic {
        indexing_maps = [affine_map<(d0) -> (d0)>],
        iterator_types = ["parallel"]}
        outs(%arg0 : tensor<5000xi64>) {
        ^bb0(%arg3: i64):  // no predecessors
          %22 = linalg.index 0 : index
          %23 = arith.index_cast %22 : index to i64
          linalg.yield %23 : i64
        } -> tensor<5000xi64>
  %1 = tensor.empty() : tensor<5000xi32>
  %2 = linalg.generic {
        indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>],
        iterator_types = ["parallel", "parallel"]}
        ins(%0 : tensor<5000xi64>) outs(%1 : tensor<5000xi32>) {
        ^bb0(%arg3: i64, %arg5: i32):  // no predecessors
          %22 = arith.index_cast %arg3 : i64 to index
          %23 = tensor.extract %arg1[%22] : tensor<5000xi32>
          linalg.yield %23 : i32
        } -> tensor<5000xi32>
  return %2 : tensor<5000xi32>
}
