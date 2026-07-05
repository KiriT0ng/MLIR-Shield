func.func @orig_vector_mask_reduce_105(%source: vector<1x2x1xf32>, %acc: vector<1x2xf32>, %mask: vector<1x2x1xi1>) -> vector<1x2xf32> {
  %0 = vector.mask %mask { vector.multi_reduction <add>, %source, %acc [2] : vector<1x2x1xf32> to vector<1x2xf32> } : vector<1x2x1xi1> -> vector<1x2xf32>
  return %0 : vector<1x2xf32>
}
