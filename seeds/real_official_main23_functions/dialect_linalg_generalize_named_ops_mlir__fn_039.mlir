func.func @matmul_transpose_b_explicit(%arg0: memref<3x5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>) {
  linalg.matmul indexing_maps = [
                       affine_map<(d0, d1, d2) -> (d0, d2)>,
                       affine_map<(d0, d1, d2) -> (d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>
                      ]
                      ins(%arg0, %arg1 : memref<3x5xf32>, memref<7x5xf32>)
                      outs(%arg2: memref<3x7xf32>)
  return
}
