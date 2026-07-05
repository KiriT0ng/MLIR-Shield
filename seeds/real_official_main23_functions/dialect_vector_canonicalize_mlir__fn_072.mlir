func.func @fold_extract_shapecast_to_shapecast(%arg0 : vector<3x4xf32>) -> vector<12xf32> {
  %0 = vector.shape_cast %arg0 : vector<3x4xf32> to vector<1x12xf32>
  %r = vector.extract %0[0] : vector<12xf32> from vector<1x12xf32>
  return %r : vector<12xf32>
}
