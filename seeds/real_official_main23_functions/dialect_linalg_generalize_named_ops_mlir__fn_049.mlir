func.func @contract_matmul_bcast_a_b(
    %A: memref<5xf32>, %B: memref<5xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [#accessAB, #accessAB, #accessC]
      ins(%A, %B : memref<5xf32>, memref<5xf32>)
      outs(%C: memref<3x7xf32>)
  return
}
