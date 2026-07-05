func.func @contiguous_gather_2d(%base: memref<?x?xf32>,
                                %mask: vector<4x4xi1>, %passthru: vector<4x4xf32>) -> vector<4x4xf32> {
  %c0 = arith.constant 0 : index
  %indices = arith.constant dense<[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]]> : vector<4x4xi32>
  %1 = vector.gather %base[%c0, %c0][%indices], %mask, %passthru :
    memref<?x?xf32>, vector<4x4xi32>, vector<4x4xi1>, vector<4x4xf32> into vector<4x4xf32>
  return %1 : vector<4x4xf32>
}
