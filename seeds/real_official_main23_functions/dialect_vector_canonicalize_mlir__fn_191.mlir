func.func @masked_reduce_one_element_vector_extract(%a : vector<1xf32>, %mask : vector<1xi1>) -> f32 {
  %s = vector.mask %mask { vector.reduction <add>, %a : vector<1xf32> into f32 }
         : vector<1xi1> -> f32
  return %s : f32
}
