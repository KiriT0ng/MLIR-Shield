func.func @extract_dense_resource_nofold() -> i64 {
  %c0 = arith.constant 0 : index
  %cst = arith.constant dense_resource<__elided__> : tensor<1xi64>
  %extracted = tensor.extract %cst[%c0] : tensor<1xi64>
  return %extracted : i64
}
