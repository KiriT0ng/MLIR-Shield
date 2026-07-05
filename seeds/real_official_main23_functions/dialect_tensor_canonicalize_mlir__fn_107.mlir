func.func @pad_fold_static(%arg0: tensor<?x64x?x?xf32>) -> tensor<?x?x?x?xf32> {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : f32
  %padding = arith.constant 4 : index
  %padded = tensor.pad %arg0 low[0, %padding, 1, 1] high[0, %padding, 1, 1]  {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
    tensor.yield %cst: f32
  } : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
  return %padded : tensor<?x?x?x?xf32>
}
