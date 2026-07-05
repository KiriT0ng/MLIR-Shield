func.func @fcmp(f32, f32) -> () {
^bb0(%arg0: f32, %arg1: f32):
  %1 = arith.cmpf oeq, %arg0, %arg1 : f32
  %2 = arith.cmpf ogt, %arg0, %arg1 : f32
  %3 = arith.cmpf oge, %arg0, %arg1 : f32
  %4 = arith.cmpf olt, %arg0, %arg1 : f32
  %5 = arith.cmpf ole, %arg0, %arg1 : f32
  %6 = arith.cmpf one, %arg0, %arg1 : f32
  %7 = arith.cmpf ord, %arg0, %arg1 : f32
  %8 = arith.cmpf ueq, %arg0, %arg1 : f32
  %9 = arith.cmpf ugt, %arg0, %arg1 : f32
  %10 = arith.cmpf uge, %arg0, %arg1 : f32
  %11 = arith.cmpf ult, %arg0, %arg1 : f32
  %12 = arith.cmpf ule, %arg0, %arg1 : f32
  %13 = arith.cmpf une, %arg0, %arg1 : f32
  %14 = arith.cmpf uno, %arg0, %arg1 : f32

  %15 = arith.cmpf oeq, %arg0, %arg1 {fastmath = #arith.fastmath<fast>} : f32

  return
}
