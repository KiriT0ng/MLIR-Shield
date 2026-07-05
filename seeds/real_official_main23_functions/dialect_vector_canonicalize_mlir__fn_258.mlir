func.func @contiguous_gather_const_mask(%base: memref<?xf32>,
                                        %passthru: vector<16xf32>) -> vector<16xf32> {
  %c0 = arith.constant 0 : index
  %indices = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : vector<16xi32>
  %mask = arith.constant dense<true> : vector<16xi1>
  %1 = vector.gather %base[%c0][%indices], %mask, %passthru :
    memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
  return %1 : vector<16xf32>
}
