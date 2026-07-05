func.func @truncf_neg_inf_to_finite_only_no_fold() -> f4E2M1FN {
  %neg_inf = arith.constant 0xFF800000 : f32
  %result = arith.truncf %neg_inf : f32 to f4E2M1FN
  return %result : f4E2M1FN
}
