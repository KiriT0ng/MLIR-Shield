func.func @reduce_one_element_vector_maximumf(%a : vector<1xf32>, %b: f32) -> f32 {
  %s = vector.reduction <maximumf>, %a, %b : vector<1xf32> into f32
  return %s : f32
}
