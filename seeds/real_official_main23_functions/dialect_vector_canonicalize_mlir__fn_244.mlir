func.func @insert_scalar_poison_idx(%a: vector<4x5xf32>, %b: f32)
    -> vector<4x5xf32> {
  %0 = vector.insert %b, %a[-1, 0] : f32 into vector<4x5xf32>
  return %0 : vector<4x5xf32>
}
