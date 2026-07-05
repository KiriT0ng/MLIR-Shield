func.func @contiguous_gather_step(%base: memref<?xf32>,
                                  %mask: vector<16xi1>, %passthru: vector<16xf32>) -> vector<16xf32> {
  %c0 = arith.constant 0 : index
  %indices = vector.step : vector<16xindex>
  %1 = vector.gather %base[%c0][%indices], %mask, %passthru :
    memref<?xf32>, vector<16xindex>, vector<16xi1>, vector<16xf32> into vector<16xf32>
  return %1 : vector<16xf32>
}
