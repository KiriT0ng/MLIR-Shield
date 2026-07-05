func.func @batch_reduce_matmul_as_contract(
    %A: memref<?x?x?xf32>, %B: memref<?x?x?xf32>, %C: memref<?x?xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                       affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                       affine_map<(d0, d1, d2, d3) -> (d1, d2)>]
      ins(%A, %B : memref<?x?x?xf32>, memref<?x?x?xf32>)
      outs(%C : memref<?x?xf32>)
  return
}
