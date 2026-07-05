func.func @fold_linalg_index_memref(%0: memref<1x?xi32>, %1: memref<1x?xi32>) {
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                   affine_map<(d0, d1) -> (d1, d1)>],
                  iterator_types = ["parallel", "parallel"]}
    ins(%0 : memref<1x?xi32>)
    outs(%1 : memref<1x?xi32>) {
      ^bb0(%lhs: i32, %out: i32):
        %idx0 = linalg.index 0 : index
        %idx1 = linalg.index 1 : index
        %add = arith.addi %idx0, %idx1 : index
        %int = arith.index_cast %add : index to i32
        linalg.yield %int : i32
    }
  return
}
