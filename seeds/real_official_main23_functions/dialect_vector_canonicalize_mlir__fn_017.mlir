func.func @extract_multiple_poison_idx(%a: vector<4x5x8xf32>)
    -> vector<8xf32> {
  %0 = vector.extract %a[-1, -1] : vector<8xf32> from vector<4x5x8xf32>
  return %0 : vector<8xf32>
}
