func.func @dead_load(%base: memref<?xf32>, %indices: vector<16xi32>,
                          %mask: vector<16xi1>, %passthru: vector<16xf32>) {
  %c0 = arith.constant 0 : index
  %0 = vector.maskedload %base[%c0], %mask, %passthru :
    memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
  %1 = vector.gather %base[%c0][%indices], %mask, %passthru :
    memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
  %2 = vector.expandload %base[%c0], %mask, %passthru :
    memref<?xf32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
  return
}
