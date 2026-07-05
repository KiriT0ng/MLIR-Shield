func.func @no_fold_contiguous_gather_tensor(%base: tensor<8xf32>, %mask: vector<4xi1>, %pass_thru: vector<4xf32>) -> vector<4xf32> {
  %c0 = arith.constant 0 : index
  %indices = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
  %0 = vector.gather %base[%c0][%indices], %mask, %pass_thru :
    tensor<8xf32>, vector<4xindex>, vector<4xi1>, vector<4xf32> into vector<4xf32>
  return %0 : vector<4xf32>
}
