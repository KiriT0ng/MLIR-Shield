func.func @fold_fill_extract(%arg0 : i1) -> i1 {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %empty_dynamic = tensor.empty(%c1) : tensor<1x2x3x?xi1>
  %filled = linalg.fill ins(%arg0 : i1) outs(%empty_dynamic : tensor<1x2x3x?xi1>) -> tensor<1x2x3x?xi1>

  %extracted = tensor.extract %filled[%c0, %c0, %c0, %c0] : tensor<1x2x3x?xi1>

  return %extracted : i1
}
