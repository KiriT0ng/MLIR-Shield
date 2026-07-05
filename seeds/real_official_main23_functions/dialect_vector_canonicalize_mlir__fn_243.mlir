func.func @insert_vector_poison(%a: vector<4x8xf32>)
    -> vector<4x8xf32> {
  %0 = ub.poison : vector<8xf32>
  %1 = vector.insert %0, %a[2] : vector<8xf32> into vector<4x8xf32>
  return %1 : vector<4x8xf32>
}
