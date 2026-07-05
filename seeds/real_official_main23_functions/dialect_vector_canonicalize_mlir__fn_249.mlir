func.func @insert_multiple_poison_idx(%a: vector<4x5x8xf32>, %b: vector<8xf32>)
    -> vector<4x5x8xf32> {
  %0 = vector.insert %b, %a[-1, -1] : vector<8xf32> into vector<4x5x8xf32>
  return %0 : vector<4x5x8xf32>
}
