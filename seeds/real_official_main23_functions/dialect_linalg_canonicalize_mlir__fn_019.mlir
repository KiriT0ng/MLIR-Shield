func.func @dynamic_fill_pack(%arg0: tensor<?x?xf32>) -> tensor<?x?x16x16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
  %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
  %1 = affine.apply #map()[%dim]
  %2 = affine.apply #map()[%dim_0]
  %3 = tensor.empty(%1, %2) : tensor<?x?x16x16xf32>
  %pack = linalg.pack %0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [16, 16] into %3 : tensor<?x?xf32> -> tensor<?x?x16x16xf32>
  return %pack : tensor<?x?x16x16xf32>
}
