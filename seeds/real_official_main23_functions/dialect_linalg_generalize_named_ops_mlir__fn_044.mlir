func.func @contract_matmul_transpose_a_b(%A: memref<5x3xf32>, %B: memref<7x5xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>,
                       affine_map<(d0, d1, d2) -> (d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>]
      ins(%A, %B : memref<5x3xf32>, memref<7x5xf32>)
      outs(%C: memref<3x7xf32>)
  return
}
