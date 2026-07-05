func.func @reduce_one_element_vector_addf_fastmath(%a : vector<1xf32>, %b: f32) -> f32 {
  %s = vector.reduction <add>, %a, %b fastmath<nnan,ninf> : vector<1xf32> into f32
  return %s : f32
}
