func.func @scatter_with_mask(%arg0: memref<?xf32>, %arg1: vector<2x3xi32>, %arg2: vector<2x3xf32>) {
  %0 = arith.constant 0: index
  %1 = vector.constant_mask [2, 2] : vector<2x3xi1>
  vector.scatter %arg0[%0][%arg1], %1, %arg2 : memref<?xf32>, vector<2x3xi32>, vector<2x3xi1>, vector<2x3xf32>
  return
}
