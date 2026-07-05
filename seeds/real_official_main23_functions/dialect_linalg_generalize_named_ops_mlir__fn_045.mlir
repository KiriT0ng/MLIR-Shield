func.func @contract_batch_matmul(%A: memref<9x3x5xf32>, %B: memref<9x5x7xf32>, %C: memref<9x3x7xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                       affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                       affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>]
      ins(%A, %B : memref<9x3x5xf32>, memref<9x5x7xf32>)
      outs(%C: memref<9x3x7xf32>)
  return
}
