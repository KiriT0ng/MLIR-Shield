func.func @contract_batch_reduce_matmul_permute_m_with_k_and_k_with_n(
    %A: memref<9x5x3xf32>, %B: memref<9x7x5xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [#accessA, #accessB, #accessC]
      ins(%A, %B : memref<9x5x3xf32>, memref<9x7x5xf32>)
      outs(%C: memref<3x7xf32>)
  return
}
