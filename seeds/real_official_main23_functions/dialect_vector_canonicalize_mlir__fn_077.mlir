func.func @fold_shape_cast_from_elements(%c1: f32, %c2: f32, %c3: f32, %c4: f32) -> vector<2x2xf32>{
  %1 = vector.from_elements %c1, %c2, %c3, %c4 : vector<4xf32>
  %2 = vector.shape_cast %1 : vector<4xf32> to vector<2x2xf32>
  return %2 : vector<2x2xf32>
}
