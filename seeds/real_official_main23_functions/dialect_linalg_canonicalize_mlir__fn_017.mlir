func.func @fill_pack() -> tensor<24x32x16x16xf32> {
  %dest = tensor.empty() : tensor<384x512xf32>
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<24x32x16x16xf32>
  %1 = linalg.fill ins(%cst : f32) outs(%dest : tensor<384x512xf32>) -> tensor<384x512xf32>
  %pack = linalg.pack %1 inner_dims_pos = [0, 1] inner_tiles = [16, 16] into %0 : tensor<384x512xf32> -> tensor<24x32x16x16xf32>
  return %pack : tensor<24x32x16x16xf32>
}
