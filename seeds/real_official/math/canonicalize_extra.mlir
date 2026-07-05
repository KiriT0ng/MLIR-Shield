func.func @ceil_fold() -> f32 {
  %c = arith.constant 0.3 : f32
  %r = math.ceil %c : f32
  return %r : f32
}

func.func @ceil_fold2() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.ceil %c : f32
  return %r : f32
}

func.func @log2_fold() -> f32 {
  %c = arith.constant 4.0 : f32
  %r = math.log2 %c : f32
  return %r : f32
}

func.func @log2_fold2() -> f32 {
  %c = arith.constant 0.0 : f32
  %r = math.log2 %c : f32
  return %r : f32
}

func.func @log2_nofold2() -> f32 {
  %c = arith.constant -1.0 : f32
  %r = math.log2 %c : f32
  return %r : f32
}

func.func @log2_fold_64() -> f64 {
  %c = arith.constant 4.0 : f64
  %r = math.log2 %c : f64
  return %r : f64
}

func.func @log2_fold2_64() -> f64 {
  %c = arith.constant 0.0 : f64
  %r = math.log2 %c : f64
  return %r : f64
}

func.func @log2_nofold2_64() -> f64 {
  %c = arith.constant -1.0 : f64
  %r = math.log2 %c : f64
  return %r : f64
}

func.func @log2_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, 3.0, 4.0]> : vector<4xf32>
  %0 = math.log2 %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @powf_fold() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.powf %c, %c : f32
  return %r : f32
}

func.func @powf_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, 3.0, 4.0]> : vector<4xf32>
  %v2 = arith.constant dense<[2.0, 2.0, 2.0, 2.0]> : vector<4xf32>
  %0 = math.powf %v1, %v2 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @rsqrt_fold() -> f32 {
  %c = arith.constant 4.0 : f32
  %r = math.rsqrt %c : f32
  return %r : f32
}

func.func @rsqrt_fold_vec() -> (vector<2xf32>) {
  %v1 = arith.constant dense<[1.0, 4.0]> : vector<2xf32>
  %0 = math.rsqrt %v1 : vector<2xf32>
  return %0 : vector<2xf32>
}

func.func @rsqrt_poison() -> f32 {
  %0 = ub.poison : f32
  %1 = math.rsqrt %0 : f32
  return %1 : f32
}

func.func @sqrt_fold() -> f32 {
  %c = arith.constant 4.0 : f32
  %r = math.sqrt %c : f32
  return %r : f32
}

func.func @sqrt_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, 3.0, 4.0]> : vector<4xf32>
  %0 = math.sqrt %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @abs_fold() -> f32 {
  %c = arith.constant -4.0 : f32
  %r = math.absf %c : f32
  return %r : f32
}

func.func @copysign_fold() -> f32 {
  %c1 = arith.constant 4.0 : f32
  %c2 = arith.constant -9.0 : f32
  %r = math.copysign %c1, %c2 : f32
  return %r : f32
}

func.func @ctlz_fold1() -> i32 {
  %c = arith.constant 1 : i32
  %r = math.ctlz %c : i32
  return %r : i32
}

func.func @ctlz_fold2() -> i8 {
  %c = arith.constant 1 : i8
  %r = math.ctlz %c : i8
  return %r : i8
}

func.func @cttz_fold() -> i32 {
  %c = arith.constant 256 : i32
  %r = math.cttz %c : i32
  return %r : i32
}

func.func @ctpop_fold() -> i32 {
  %c = arith.constant 0xFF0000FF : i32
  %r = math.ctpop %c : i32
  return %r : i32
}

func.func @log10_fold() -> f32 {
  %c = arith.constant 100.0 : f32
  %r = math.log10 %c : f32
  return %r : f32
}

func.func @log10_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 10.0, 100.0, 200.0]> : vector<4xf32>
  %0 = math.log10 %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @log1p_fold() -> f32 {
  %c = arith.constant 17.0 : f32
  %r = math.log1p %c : f32
  return %r : f32
}

func.func @log1p_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[3.0, 5.0, 7.0, 11.0]> : vector<4xf32>
  %0 = math.log1p %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @log_fold() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.log %c : f32
  return %r : f32
}

func.func @log_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, 3.0, 4.0]> : vector<4xf32>
  %0 = math.log %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @exp_fold() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.exp %c : f32
  return %r : f32
}

func.func @exp_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, 3.0, 4.0]> : vector<4xf32>
  %0 = math.exp %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @exp2_fold() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.exp2 %c : f32
  return %r : f32
}

func.func @exp2_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, 3.0, 4.0]> : vector<4xf32>
  %0 = math.exp2 %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @expm1_fold() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.expm1 %c : f32
  return %r : f32
}

func.func @expm1_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.expm1 %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}


func.func @tan_fold() -> f32 {
  %c = arith.constant 1.0 : f32
  %r = math.tan %c : f32
  return %r : f32
}

func.func @tan_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.tan %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @tanh_fold() -> f32 {
  %c = arith.constant 1.0 : f32
  %r = math.tanh %c : f32
  return %r : f32
}

func.func @tanh_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.tanh %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @atan_fold() -> f32 {
  %c = arith.constant 1.0 : f32
  %r = math.atan %c : f32
  return %r : f32
}

func.func @atan_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.atan %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @atan2_fold() -> f32 {
  %c1 = arith.constant 0.0 : f32
  %c2 = arith.constant 1.0 : f32
  %r = math.atan2 %c1, %c2 : f32
  return %r : f32
}

func.func @atan2_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 0.0, 1.0, 1.0]> : vector<4xf32>
  %v2 = arith.constant dense<[1.0, 1.0, 2.0, 2.0]> : vector<4xf32>
  %0 = math.atan2 %v1, %v2 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @cos_fold() -> f32 {
  %c = arith.constant 1.0 : f32
  %r = math.cos %c : f32
  return %r : f32
}

func.func @cos_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.cos %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @roundeven_fold() -> f32 {
  %c = arith.constant 1.5 : f32
  %r = math.roundeven %c : f32
  return %r : f32
}

func.func @roundeven_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.5, -0.5, 1.5, -1.5]> : vector<4xf32>
  %0 = math.roundeven %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @round_fold() -> f32 {
  %c = arith.constant 1.5 : f32
  %r = math.round %c : f32
  return %r : f32
}

func.func @round_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.5, -0.5, 1.5, -1.5]> : vector<4xf32>
  %0 = math.round %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @floor_fold() -> f32 {
  %c = arith.constant 0.3 : f32
  %r = math.floor %c : f32
  return %r : f32
}

func.func @floor_fold2() -> f32 {
  %c = arith.constant 2.0 : f32
  %r = math.floor %c : f32
  return %r : f32
}

func.func @trunc_fold() -> f32 {
  %c = arith.constant 1.1 : f32
  %r = math.trunc %c : f32
  return %r : f32
}

func.func @trunc_fold_vec() -> (vector<4xf32>) {
  %v = arith.constant dense<[0.5, -0.5, 1.5, -1.5]> : vector<4xf32>
  %0 = math.trunc %v : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @sin_fold() -> f32 {
  %c = arith.constant 1.0 : f32
  %r = math.sin %c : f32
  return %r : f32
}

func.func @sin_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.sin %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @erf_fold() -> f32 {
  %c = arith.constant 1.0 : f32
  %r = math.erf %c : f32
  return %r : f32
}

func.func @erf_fold_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %0 = math.erf %v1 : vector<4xf32>
  return %0 : vector<4xf32>
}

func.func @abs_poison() -> f32 {
  %0 = ub.poison : f32
  %1 = math.absf %0 : f32
  return %1 : f32
}

func.func @isfinite_fold() -> i1 {
  %c = arith.constant 2.0 : f32
  %r = math.isfinite %c : f32
  return %r : i1
}

func.func @isfinite_fold_vec() -> (vector<4xi1>) {
  %v1 = arith.constant dense<2.0> : vector<4xf32>
  %0 = math.isfinite %v1 : vector<4xf32>
  return %0 : vector<4xi1>
}

func.func @isinf_fold() -> i1 {
  %c = arith.constant 2.0 : f32
  %r = math.isinf %c : f32
  return %r : i1
}

func.func @isinf_fold_vec() -> (vector<4xi1>) {
  %v1 = arith.constant dense<2.0> : vector<4xf32>
  %0 = math.isinf %v1 : vector<4xf32>
  return %0 : vector<4xi1>
}

func.func @isnan_fold() -> i1 {
  %c = arith.constant 2.0 : f32
  %r = math.isnan %c : f32
  return %r : i1
}

func.func @isnan_fold_vec() -> (vector<4xi1>) {
  %v1 = arith.constant dense<2.0> : vector<4xf32>
  %0 = math.isnan %v1 : vector<4xf32>
  return %0 : vector<4xi1>
}

func.func @isnormal_fold() -> i1 {
  %c = arith.constant 2.0 : f32
  %r = math.isnormal %c : f32
  return %r : i1
}

func.func @isnormal_fold_vec() -> (vector<4xi1>) {
  %v1 = arith.constant dense<2.0> : vector<4xf32>
  %0 = math.isnormal %v1 : vector<4xf32>
  return %0 : vector<4xi1>
}

func.func @ipowi_i1_const_pos_exp() -> i1 {
  %b = arith.constant true    
  %e = arith.constant false   
  %r = math.ipowi %b, %e : i1
  return %r : i1
}

func.func @ipowi_i1_const_neg_exp() -> i1 {
  %b = arith.constant true    
  %e = arith.constant true    
  %r = math.ipowi %b, %e : i1
  return %r : i1
}

func.func @fpowi_fold() -> (f64, f32) {
  %cst = arith.constant 2.000000e+00 : f64
  %cst_0 = arith.constant 2.000000e+00 : f32
  %c2_i32 = arith.constant 2 : i32
  %0 = math.fpowi %cst, %c2_i32 : f64, i32
  %1 = math.fpowi %cst_0, %c2_i32 : f32, i32
  return %0, %1 : f64, f32
}

func.func @fpowi_fold_vec() -> vector<4xf32> {
  %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
  %cst_0 = arith.constant dense<[2, 4, 2, 2]> : vector<4xi32>
  %0 = math.fpowi %cst, %cst_0 : vector<4xf32>, vector<4xi32>
  return %0 : vector<4xf32>
}

// 16777217 is not exactly representable in f32.
func.func @fpowi_fold_failed() -> f32 {
  %cst = arith.constant 2.000000e+00 : f32
  %c16777217_i32 = arith.constant 16777217 : i32
  %0 = math.fpowi %cst, %c16777217_i32 : f32, i32
  return %0 : f32
}

func.func @sincos_fold_f32() -> (f32, f32) {
  %cst = arith.constant 1.000000e+00 : f32
  %sin, %cos = math.sincos %cst : f32
  return %sin, %cos : f32, f32
}

func.func @sincos_fold_f64() -> (f64, f64) {
  %cst = arith.constant 1.000000e+00 : f64
  %sin, %cos = math.sincos %cst : f64
  return %sin, %cos : f64, f64
}

func.func @sincos_fold_vec() -> (vector<4xf32>, vector<4xf32>) {
  %cst = arith.constant dense<[0.0, 1.0, 0.0, 1.0]> : vector<4xf32>
  %sin, %cos = math.sincos %cst : vector<4xf32>
  return %sin, %cos : vector<4xf32>, vector<4xf32>
}

func.func @cbrt_fold() -> (f64, f32) {
  %cst = arith.constant 8.000000e+00 : f64
  %cst_0 = arith.constant -8.000000e+00 : f32
  %0 = math.cbrt %cst : f64
  %1 = math.cbrt %cst_0 : f32
  return %0, %1 : f64, f32
}

func.func @cbrt_fold_vec() -> vector<4xf32> {
  %cst = arith.constant dense<[-1.0, 0.0, 1.0, 8.0]> : vector<4xf32>
  %0 = math.cbrt %cst : vector<4xf32>
  return %0 : vector<4xf32>
}
