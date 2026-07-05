func.func @fold_extract_broadcast_dim1_broadcasting(%a : vector<2x1xf32>,
  %idx : index, %idx1 : index, %idx2 : index) -> f32 {
  %b = vector.broadcast %a : vector<2x1xf32> to vector<1x2x4xf32>
  %r = vector.extract %b[%idx, %idx1, %idx2] : f32 from vector<1x2x4xf32>
  return %r : f32
}
