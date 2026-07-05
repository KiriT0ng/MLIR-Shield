func.func @fold_extract_shuffle(%a : vector<8xf32>, %b : vector<8xf32>)
                                -> (f32, f32, f32, f32) {
  %shuffle = vector.shuffle %a, %b [0, 8, 7, 15] : vector<8xf32>, vector<8xf32>
  %e0 = vector.extract %shuffle[0] : f32 from vector<4xf32>
  %e1 = vector.extract %shuffle[1] : f32 from vector<4xf32>
  %e2 = vector.extract %shuffle[2] : f32 from vector<4xf32>
  %e3 = vector.extract %shuffle[3] : f32 from vector<4xf32>
  return %e0, %e1, %e2, %e3 : f32, f32, f32, f32
}
