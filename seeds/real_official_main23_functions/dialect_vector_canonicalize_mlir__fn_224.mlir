func.func @from_elements_to_elements_dup_elems(%a: vector<4xf32>) -> vector<4x2xf32> {
  %0:4 = vector.to_elements %a : vector<4xf32> // 4 elements
  %1 = vector.from_elements %0#0, %0#1, %0#2, %0#3, %0#0, %0#1, %0#2, %0#3 : vector<4x2xf32>
  return %1 : vector<4x2xf32>
}
