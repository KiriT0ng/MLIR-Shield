#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @fuse_scalar_constant(%arg0 : tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xi32>) {
  %cst = arith.constant 4.0 : f32
  %c42 = arith.constant 42 : i32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %0 = tensor.empty(%d0, %d1) : tensor<?x?xf32>
  %1 = tensor.empty(%d0, %d1) : tensor<?x?xi32>
  %2:2 = linalg.generic {
      indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                       affine_map<(d0, d1) -> ()>,
                       affine_map<(d0, d1) -> ()>,
                       affine_map<(d0, d1) -> (d0, d1)>,
                       affine_map<(d0, d1) -> (d0, d1)>],
      iterator_types = ["parallel", "parallel"]}
      ins(%arg0, %cst, %c42 : tensor<?x?xf32>, f32, i32)
      outs(%0, %1 : tensor<?x?xf32>, tensor<?x?xi32>) {
      ^bb0(%arg1 : f32, %arg2 : f32, %arg3 : i32, %arg4 : f32, %arg5 : i32) :
        %3 = arith.addf %arg1, %arg2 : f32
        linalg.yield %3, %arg3 : f32, i32
      } -> (tensor<?x?xf32>, tensor<?x?xi32>)
  return %2#0, %2#1 : tensor<?x?xf32>, tensor<?x?xi32>
}
