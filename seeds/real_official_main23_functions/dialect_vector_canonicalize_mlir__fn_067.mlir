func.func @fold_extract_broadcastlike_shape_cast(%a : vector<1xf32>, %idx0 : index)
  -> vector<1x1xf32> {
  %s = vector.shape_cast %a : vector<1xf32> to vector<1x1x1xf32>
  %r = vector.extract %s[%idx0] : vector<1x1xf32> from vector<1x1x1xf32>
  return %r : vector<1x1xf32>
}
