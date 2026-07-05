func.func @gather_with_zero_mask(%arg0: memref<?xf32>, %arg1: vector<2x3xi32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
  %0 = arith.constant 0: index
  %1 = vector.constant_mask [0, 0] : vector<2x3xi1>
  %2 = vector.gather %arg0[%0][%arg1], %1, %arg2 : memref<?xf32>, vector<2x3xi32>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
  return %2 : vector<2x3xf32>
}
