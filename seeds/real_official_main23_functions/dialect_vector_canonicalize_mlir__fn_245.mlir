func.func @insert_vector_poison_idx(%a: vector<4x5xf32>, %b: vector<5xf32>)
    -> vector<4x5xf32> {
  %0 = vector.insert %b, %a[-1] : vector<5xf32> into vector<4x5xf32>
  return %0 : vector<4x5xf32>
}
