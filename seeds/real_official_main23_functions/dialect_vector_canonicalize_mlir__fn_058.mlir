func.func @negative_fold_extract_broadcast(%a : vector<1x1xf32>) -> vector<4xf32> {
  %b = vector.broadcast %a : vector<1x1xf32> to vector<1x1x4xf32>
  %r = vector.extract %b[0, 0] : vector<4xf32> from vector<1x1x4xf32>
  return %r : vector<4xf32>
}
