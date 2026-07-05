func.func @gather_with_mask_scalable(%arg0: memref<?xf32>, %arg1: vector<2x[3]xi32>, %arg2: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
  %0 = arith.constant 0: index
  // vector.constant_mask only supports 'none set' or 'all set' scalable
  // dimensions, hence [2, 3] rather than [2, 2] as in the example for fixed
  // width vectors above.
  %1 = vector.constant_mask [2, 3] : vector<2x[3]xi1>
  %2 = vector.gather %arg0[%0][%arg1], %1, %arg2 : memref<?xf32>, vector<2x[3]xi32>, vector<2x[3]xi1>, vector<2x[3]xf32> into vector<2x[3]xf32>
  return %2 : vector<2x[3]xf32>
}
