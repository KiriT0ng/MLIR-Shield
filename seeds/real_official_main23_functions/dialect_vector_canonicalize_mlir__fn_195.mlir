func.func @dont_reduce_one_element_vector(%a : vector<4xf32>) -> f32 {
  %s = vector.reduction <add>, %a : vector<4xf32> into f32
  return %s : f32
}
