func.func @fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
  %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
  %1 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
  %2 = arith.negf %arg0 fastmath<fast> : f32
  %3 = arith.addf %arg0, %arg1 fastmath<none> : f32
  %4 = arith.addf %arg0, %arg1 fastmath<nnan,ninf> : f32
  return
}
