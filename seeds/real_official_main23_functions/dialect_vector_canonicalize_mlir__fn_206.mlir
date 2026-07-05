func.func @extract_from_stretch_broadcast(%src: vector<3x1x2xf32>) -> f32 {
  %0 = vector.broadcast %src : vector<3x1x2xf32> to vector<3x4x2xf32>
  %1 = vector.extract %0[0, 2, 0] : f32 from vector<3x4x2xf32>
  return %1: f32
}
