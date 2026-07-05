func.func @supported_fp_type(%arg0: f32, %arg1: vector<4xf32>, %arg2: vector<4x8xf32>, %arg3: f32) {
  %0 = arith.addf %arg0, %arg0 : f32
  %1 = arith.addf %arg1, %arg1 : vector<4xf32>
  %2 = arith.addf %arg2, %arg2 : vector<4x8xf32>
  %3 = arith.cmpf oeq, %arg0, %arg3 : f32
  return
}
