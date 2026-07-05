func.func @ops_supporting_fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
  %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
  %1 = arith.divf %arg0, %arg1 fastmath<fast> : f32
  %2 = arith.maximumf %arg0, %arg1 fastmath<fast> : f32
  %3 = arith.minimumf %arg0, %arg1 fastmath<fast> : f32
  %4 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
  %5 = arith.negf %arg0 fastmath<fast> : f32
  %6 = arith.remf %arg0, %arg1 fastmath<fast> : f32
  %7 = arith.subf %arg0, %arg1 fastmath<fast> : f32
  return
}
