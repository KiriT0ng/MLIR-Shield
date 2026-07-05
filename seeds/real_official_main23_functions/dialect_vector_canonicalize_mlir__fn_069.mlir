func.func @fold_extract_shapecast_0d_result(%arg0 : vector<1x1x1xf32>) -> f32 {
  %0 = vector.shape_cast %arg0 : vector<1x1x1xf32> to vector<f32>
  %r = vector.extract %0[] : f32 from vector<f32>
  return %r : f32
}
