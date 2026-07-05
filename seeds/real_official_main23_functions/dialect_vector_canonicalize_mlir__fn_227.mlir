func.func @to_elements_of_vector_broadcast(%vec: vector<2xf32>) -> (f32, f32, f32, f32, f32, f32) {
  %v = vector.broadcast %vec : vector<2xf32> to vector<3x2xf32>
  %e:6 = vector.to_elements %v : vector<3x2xf32>
  return %e#0, %e#1, %e#2, %e#3, %e#4, %e#5 : f32, f32, f32, f32, f32, f32
}
