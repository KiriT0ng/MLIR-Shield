func.func @to_elements_of_vector_broadcast_inner_dim(%v: vector<2x1x2xf32>) -> (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) {
  %b = vector.broadcast %v : vector<2x1x2xf32> to vector<2x3x2xf32>
  %e:12 = vector.to_elements %b : vector<2x3x2xf32>
  return %e#0, %e#1, %e#2, %e#3, %e#4, %e#5, %e#6, %e#7, %e#8, %e#9, %e#10, %e#11 :
    f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
}
