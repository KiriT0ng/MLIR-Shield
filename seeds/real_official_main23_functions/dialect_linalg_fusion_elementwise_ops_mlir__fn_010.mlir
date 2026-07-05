#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @one_dim_indexed_producer_consumer_fusion(%arg0 : tensor<?xi32>,
                                               %arg1 : tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?xi32>
  %0 = tensor.empty(%d0) : tensor<?xi32>
  %1 = linalg.generic
      {indexing_maps = [#map1, #map1],
       iterator_types = ["parallel"]}
      ins(%arg0 : tensor<?xi32>) outs(%0 : tensor<?xi32>) {
      ^bb0(%arg2 : i32, %arg3 : i32):
        %2 = linalg.index 0 : index
        %3 = arith.index_cast %2 : index to i32
        %4 = arith.addi %arg2, %3 : i32
        linalg.yield %4 : i32
      } -> tensor<?xi32>
  %2 = tensor.dim %arg1, %c0 : tensor<?x?xi32>
  %3 = tensor.dim %arg1, %c1 : tensor<?x?xi32>
  %4 = tensor.empty(%2, %3) : tensor<?x?xi32>
  %5 = linalg.generic
      {indexing_maps = [#map2, #map3, #map2],
       iterator_types = ["parallel", "parallel"]}
      ins(%arg1, %1 : tensor<?x?xi32>, tensor<?xi32>)
      outs(%4 : tensor<?x?xi32>) {
      ^bb0(%arg2 : i32, %arg3 : i32, %arg4: i32):
        %6 = arith.addi %arg2, %arg3 : i32
        linalg.yield %6 : i32
     } -> tensor<?x?xi32>
  return %5 : tensor<?x?xi32>
}
