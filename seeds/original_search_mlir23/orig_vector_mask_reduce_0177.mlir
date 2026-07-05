func.func @orig_vector_mask_reduce_177(%source: vector<1x4x1xf32>, %acc: vector<1x4xf32>, %mask: vector<1x4x1xi1>) -> vector<1x4xf32> {
  %0 = vector.mask %mask { vector.multi_reduction <add>, %source, %acc [2] : vector<1x4x1xf32> to vector<1x4xf32> } : vector<1x4x1xi1> -> vector<1x4xf32>
  return %0 : vector<1x4xf32>
}
