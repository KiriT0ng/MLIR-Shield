func.func @to_elements_from_elements_no_op(%a: f32, %b: f32) -> (f32, f32) {
  %0 = vector.from_elements %b, %a : vector<2xf32>
  %1:2 = vector.to_elements %0 : vector<2xf32>
  return %1#0, %1#1 : f32, f32
}
