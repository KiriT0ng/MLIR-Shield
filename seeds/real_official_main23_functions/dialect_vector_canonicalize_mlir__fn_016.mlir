func.func @extract_vector_poison_idx(%a: vector<4x5xf32>) -> vector<5xf32> {
  %0 = vector.extract %a[-1] : vector<5xf32> from vector<4x5xf32>
  return %0 : vector<5xf32>
}
