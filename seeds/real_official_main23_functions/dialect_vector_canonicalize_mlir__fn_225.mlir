func.func @from_elements_to_elements_shuffle(%a: vector<4x2xf32>) -> vector<4x2xf32> {
  %0:8 = vector.to_elements %a : vector<4x2xf32>
  %1 = vector.from_elements %0#7, %0#0, %0#6, %0#1, %0#5, %0#2, %0#4, %0#3 : vector<4x2xf32>
  return %1 : vector<4x2xf32>
}
