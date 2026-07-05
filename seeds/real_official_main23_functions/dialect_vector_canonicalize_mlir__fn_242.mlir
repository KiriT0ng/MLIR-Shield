func.func @insert_scalar_poison(%a: vector<4x8xf32>)
    -> vector<4x8xf32> {
  %0 = ub.poison : f32
  %1 = vector.insert %0, %a[2, 3] : f32 into vector<4x8xf32>
  return %1 : vector<4x8xf32>
}
