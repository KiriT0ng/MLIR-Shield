func.func @empty_vector_mask_with_passthru(%a : vector<8xf32>, %mask : vector<8xi1>,
                                           %passthru : vector<8xf32>) -> vector<8xf32> {
  %0 = vector.mask %mask, %passthru { vector.yield %a : vector<8xf32> } : vector<8xi1> -> vector<8xf32>
  return %0 : vector<8xf32>
}
