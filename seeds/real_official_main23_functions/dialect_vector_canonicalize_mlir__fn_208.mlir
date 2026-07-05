func.func @fold_0d_vector_reduction(%arg0: vector<f32>) -> f32 {
  %0 = vector.reduction <add>, %arg0 : vector<f32> into f32
  return %0 : f32
}
