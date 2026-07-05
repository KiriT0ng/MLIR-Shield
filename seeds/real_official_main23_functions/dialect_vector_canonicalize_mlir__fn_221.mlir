func.func @extract_from_splatlike_broadcast(%a: f32, %b: vector<f32>, %c: vector<2xf32>) -> (f32, f32, f32, f32, vector<6x7xf32>, vector<3xf32>) {
  // Broadcast scalar to 0D and extract scalar.
  %0 = vector.broadcast %a : f32 to vector<f32>
  %1 = vector.extract %0[] : f32 from vector<f32>

  // Broadcast 0D to 3D and extract scalar.
  %4 = vector.broadcast %b : vector<f32> to vector<1x2x4xf32>
  %5 = vector.extract %4[0, 0, 1] : f32 from vector<1x2x4xf32>

  // Broadcast scalar to 2D and extract scalar.
  %6 = vector.broadcast %a : f32 to vector<2x3xf32>
  %7 = vector.extract %6[0, 1] : f32 from vector<2x3xf32>

  // Broadcast scalar to 3D and extract scalar.
  %8 = vector.broadcast %a : f32 to vector<5x6x7xf32>
  %9 = vector.extract %8[2, 1, 5] : f32 from vector<5x6x7xf32>

  // Extract 2D from 3D that was broadcasted from a scalar.
  %10 = vector.extract %8[2] : vector<6x7xf32> from vector<5x6x7xf32>

  // Extract 1D from 2D that was splat'ed from a scalar.
  %11 = vector.extract %6[1] : vector<3xf32> from vector<2x3xf32>

  return %1, %5, %7, %9, %10, %11 : f32, f32, f32, f32, vector<6x7xf32>, vector<3xf32>
}
