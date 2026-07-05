func.func @gather_broadcast(%base: memref<?xf32>,
                             %mask: vector<16xi1>, %passthru: vector<16xf32>) -> vector<16xf32> {
  %c0 = arith.constant 0 : index
  %indices = arith.constant dense<0> : vector<16xi32>
  %1 = vector.gather %base[%c0][%indices], %mask, %passthru :
    memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32> into vector<16xf32>
  return %1 : vector<16xf32>
}
