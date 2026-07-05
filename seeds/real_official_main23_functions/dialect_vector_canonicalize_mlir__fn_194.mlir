func.func @reduce_one_element_vector_mulf(%a : vector<1xf32>, %b: f32) -> f32 {
  %s = vector.reduction <mul>, %a, %b : vector<1xf32> into f32
  return %s : f32
}
