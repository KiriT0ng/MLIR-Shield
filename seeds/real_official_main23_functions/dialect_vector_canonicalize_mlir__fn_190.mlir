func.func @reduce_one_element_vector_extract(%a : vector<1xf32>) -> f32 {
  %s = vector.reduction <add>, %a : vector<1xf32> into f32
  return %s : f32
}
