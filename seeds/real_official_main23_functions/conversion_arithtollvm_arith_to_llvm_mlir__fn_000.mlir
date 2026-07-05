func.func @vector_ops(%arg0: vector<4xf32>, %arg1: vector<4xi1>, %arg2: vector<4xi64>, %arg3: vector<4xi64>) -> vector<4xf32> {
  %0 = arith.constant dense<42.> : vector<4xf32>
  %1 = arith.addf %arg0, %0 : vector<4xf32>
  %3 = arith.divsi %arg2, %arg2 : vector<4xi64>
  %4 = arith.divui %arg2, %arg2 : vector<4xi64>
  %5 = arith.remsi %arg2, %arg2 : vector<4xi64>
  %6 = arith.remui %arg2, %arg2 : vector<4xi64>
  %7 = arith.divf %arg0, %0 : vector<4xf32>
  %8 = arith.remf %arg0, %0 : vector<4xf32>
  %9 = arith.andi %arg2, %arg3 : vector<4xi64>
  %10 = arith.ori %arg2, %arg3 : vector<4xi64>
  %11 = arith.xori %arg2, %arg3 : vector<4xi64>
  %12 = arith.shli %arg2, %arg2 : vector<4xi64>
  %13 = arith.shrsi %arg2, %arg2 : vector<4xi64>
  %14 = arith.shrui %arg2, %arg2 : vector<4xi64>
  return %1 : vector<4xf32>
}
