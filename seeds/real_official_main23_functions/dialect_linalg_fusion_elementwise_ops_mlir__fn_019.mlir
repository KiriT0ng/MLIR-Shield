#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @fusion_different_axes_indexed(%arg0: tensor<2x2xi32>) ->  tensor<2xi32> {
  %0 = tensor.empty() : tensor<2x2xi32>
  %1 = linalg.generic {
        indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>],
        iterator_types = ["parallel", "parallel"]}
        ins(%arg0 : tensor<2x2xi32>) outs(%0 : tensor<2x2xi32>) {
          ^bb0(%in: i32, %out: i32):
            %2 = linalg.index 1 : index
            %3 = arith.index_cast %2 : index to i32
            linalg.yield %3 : i32
        } -> tensor<2x2xi32>
  %4 = tensor.empty() : tensor<2xi32>
  %5 = linalg.generic {
        indexing_maps = [affine_map<(d0) -> (d0, 1)>, affine_map<(d0) -> (d0)>],
        iterator_types = ["parallel"]}
        ins(%1 : tensor<2x2xi32>) outs(%4 : tensor<2xi32>) {
          ^bb0(%in: i32, %out: i32):
            linalg.yield %in : i32
        } -> tensor<2xi32>
  return %5 : tensor<2xi32>
}
