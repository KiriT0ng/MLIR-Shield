func.func @contiguous_scatter_const_mask(%base: memref<?xf32>,
                                         %value: vector<16xf32>) {
  %c0 = arith.constant 0 : index
  %indices = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : vector<16xi32>
  %mask = vector.constant_mask [16] : vector<16xi1>
  vector.scatter %base[%c0][%indices], %mask, %value :
    memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>
  return
}
