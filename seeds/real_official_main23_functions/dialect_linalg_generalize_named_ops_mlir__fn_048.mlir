func.func @contract_dot(
    %A: memref<9xf32>, %B: memref<9xf32>, %C: memref<f32>) {
  linalg.contract
      indexing_maps = [#accessAB, #accessAB, #accessC]
      ins(%A, %B : memref<9xf32>, memref<9xf32>)
      outs(%C: memref<f32>)
  return
}
