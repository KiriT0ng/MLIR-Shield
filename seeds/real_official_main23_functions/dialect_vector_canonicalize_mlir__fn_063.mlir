func.func @fold_extract_shape_cast_to_lower_rank(%a : vector<2x4xf32>,
  %idx0 : index, %idx1 : index) -> vector<4xf32> {
  %b = vector.shape_cast %a : vector<2x4xf32> to vector<1x2x4xf32>
  %r = vector.extract %b[%idx0, %idx1] : vector<4xf32> from vector<1x2x4xf32>
  return %r : vector<4xf32>
}
