func.func @contract_matmul(%A: memref<3x5xf32>, %B: memref<5x7xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>,
                       affine_map<(d0, d1, d2) -> (d2, d1)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>]
      ins(%A, %B : memref<3x5xf32>, memref<5x7xf32>)
      outs(%C: memref<3x7xf32>)

  return
}
