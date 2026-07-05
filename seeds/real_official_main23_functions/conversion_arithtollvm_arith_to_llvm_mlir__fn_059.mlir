func.func @unsupported_fp_type(%arg0: f4E2M1FN, %arg1: vector<4xf4E2M1FN>, %arg2: vector<8x4xf4E2M1FN>, %arg3: f4E2M1FN, %arg4: i1) {
  %0 = arith.addf %arg0, %arg0 : f4E2M1FN
  %1 = arith.addf %arg1, %arg1 : vector<4xf4E2M1FN>
  %2 = arith.addf %arg2, %arg2 : vector<8x4xf4E2M1FN>
  %3 = arith.cmpf oeq, %arg0, %arg3 : f4E2M1FN
  %4 = arith.select %arg4, %arg0, %arg3 : f4E2M1FN
  return
}
