func.func @contract_batch_reduce_matmul(
    %A: memref<9x3x5xf32>, %B: memref<9x5x7xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [#accessA, #accessB, #accessC]
      ins(%A, %B : memref<9x3x5xf32>, memref<9x5x7xf32>)
      outs(%C: memref<3x7xf32>)
  return
}
