func.func @minmaxf(%arg0 : f32, %arg1 : f32) -> f32 {
  %0 = arith.minimumf %arg0, %arg1 : f32
  %1 = arith.maximumf %arg0, %arg1 : f32
  %2 = arith.minnumf %arg0, %arg1 : f32
  %3 = arith.maxnumf %arg0, %arg1 : f32
  return %0 : f32
}
