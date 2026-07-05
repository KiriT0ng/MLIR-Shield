func.func @fpext(%arg0 : f16, %arg1 : f32) {
  %0 = arith.extf %arg0: f16 to f32
  %1 = arith.extf %arg0: f16 to f64
  %2 = arith.extf %arg1: f32 to f64
  return
}
