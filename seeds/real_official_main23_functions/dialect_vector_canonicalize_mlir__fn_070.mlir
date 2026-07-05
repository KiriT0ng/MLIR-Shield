func.func @fold_extract_shapecast_0d_source(%arg0 : vector<f32>) -> f32 {
  %0 = vector.shape_cast %arg0 : vector<f32> to vector<1xf32>
  %r = vector.extract %0[0] : f32 from vector<1xf32>
  return %r : f32
}
