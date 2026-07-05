func.func @convertf_fold_f8() -> f8E5M2 {
  %c = arith.constant 2.0 : f8E4M3FN
  %result = arith.convertf %c : f8E4M3FN to f8E5M2
  return %result : f8E5M2
}
