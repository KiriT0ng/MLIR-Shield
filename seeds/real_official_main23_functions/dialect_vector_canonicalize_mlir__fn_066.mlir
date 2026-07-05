func.func @fold_extract_broadcast_to_equal_rank(%a : vector<1xf32>, %idx0 : index)
  -> vector<8xf32> {
  %b = vector.broadcast %a : vector<1xf32> to vector<1x8xf32>
  %r = vector.extract %b[%idx0] : vector<8xf32> from vector<1x8xf32>
  return %r : vector<8xf32>
}
