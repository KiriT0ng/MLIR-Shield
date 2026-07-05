func.func @ops(f32, f32, i32, i32, f64) -> (f32, i32) {
^bb0(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32, %arg4: f64):
  %0 = arith.subf %arg0, %arg1: f32
  %1 = arith.subi %arg2, %arg3: i32
  %2 = arith.cmpi slt, %arg2, %1 : i32
  %3 = arith.cmpi sle, %arg2, %1 : i32
  %4 = arith.cmpi sgt, %arg2, %1 : i32
  %5 = arith.cmpi ult, %arg2, %1 : i32
  %6 = arith.cmpi ule, %arg2, %1 : i32
  %7 = arith.cmpi ugt, %arg2, %1 : i32
  %8 = arith.cmpi eq, %arg2, %1 : i32
  %9 = arith.divsi %arg2, %arg3 : i32
  %10 = arith.divui %arg2, %arg3 : i32
  %11 = arith.remsi %arg2, %arg3 : i32
  %12 = arith.remui %arg2, %arg3 : i32
  %13 = arith.divf %arg0, %arg1 : f32
  %14 = arith.remf %arg0, %arg1 : f32
  %15 = arith.andi %arg2, %arg3 : i32
  %16 = arith.ori %arg2, %arg3 : i32
  %17 = arith.xori %arg2, %arg3 : i32
  %18 = arith.constant 7.9e-01 : f64
  %19 = arith.shli %arg2, %arg3 : i32
  %20 = arith.shrsi %arg2, %arg3 : i32
  %21 = arith.shrui %arg2, %arg3 : i32
  // There is no type conversion rule for tf32.
  %22 = arith.constant 2.0 : tf32
  return %0, %10 : f32, i32
}
