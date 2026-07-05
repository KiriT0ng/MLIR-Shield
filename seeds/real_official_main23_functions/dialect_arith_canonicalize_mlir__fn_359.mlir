func.func @truncf_inf_to_finite_only_no_fold() -> f4E2M1FN {
  %inf = arith.constant 0x7F800000 : f32
  %result = arith.truncf %inf : f32 to f4E2M1FN
  return %result : f4E2M1FN
}
