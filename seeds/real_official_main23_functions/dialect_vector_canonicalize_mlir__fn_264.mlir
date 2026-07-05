func.func @contiguous_scatter_step(%base: memref<?xf32>,
                                   %mask: vector<16xi1>, %value: vector<16xf32>) {
  %c0 = arith.constant 0 : index
  %indices = vector.step : vector<16xindex>
  vector.scatter %base[%c0][%indices], %mask, %value :
    memref<?xf32>, vector<16xindex>, vector<16xi1>, vector<16xf32>
  return
}
