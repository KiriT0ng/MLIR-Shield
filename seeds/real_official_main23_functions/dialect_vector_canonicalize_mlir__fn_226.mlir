func.func @to_elements_of_scalar_broadcast_folds(%s: f32) -> (f32, f32, f32, f32) {
  %v = vector.broadcast %s : f32 to vector<4xf32>
  %e:4 = vector.to_elements %v : vector<4xf32>
  return %e#0, %e#1, %e#2, %e#3 : f32, f32, f32, f32
}
