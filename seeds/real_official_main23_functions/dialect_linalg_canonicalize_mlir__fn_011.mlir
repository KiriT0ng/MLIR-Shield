func.func @fold_linalg_index_tensor_static(%0: tensor<4x16xi32>, %1: tensor<1x16xi32>,
                                           %2: tensor<4x1xi32>) -> tensor<4x1xi32> {
  %res = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>,
                                          affine_map<(d0, d1, d2) -> (d1, d2)>,
                                          affine_map<(d0, d1, d2) -> (d0, d1)>],
                         iterator_types = ["parallel", "parallel", "reduction"]}
    ins(%0, %1 : tensor<4x16xi32>, tensor<1x16xi32>)
    outs(%2 : tensor<4x1xi32>) {
      ^bb0(%lhs: i32, %rhs: i32, %out: i32):
        %idx0 = linalg.index 0 : index
        %idx1 = linalg.index 1 : index
        %idx2 = linalg.index 2 : index
        %add0 = arith.addi %idx0, %idx1 : index
        %add1 = arith.addi %add0, %idx2 : index
        %int = arith.index_cast %add1 : index to i32
        linalg.yield %int : i32
    } -> tensor<4x1xi32>
  return %res : tensor<4x1xi32>
}
