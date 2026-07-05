func.func @negative_fold_extract_shapecast(%arg0 : vector<16xf32>) -> vector<4x2xf32> {
  %0 = vector.shape_cast %arg0 : vector<16xf32> to vector<2x4x2xf32>
  %r = vector.extract %0[1] : vector<4x2xf32> from vector<2x4x2xf32>
  return %r : vector<4x2xf32>
}
