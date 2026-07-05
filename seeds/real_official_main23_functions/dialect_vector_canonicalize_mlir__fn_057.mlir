func.func @fold_extract_broadcast_0dvec_input_scalar_output(%a : vector<f32>,
  %idx0 : index, %idx1 : index, %idx2: index) -> f32 {
  %b = vector.broadcast %a : vector<f32> to vector<1x2x4xf32>
  %r = vector.extract %b[%idx0, %idx1, %idx2] : f32 from vector<1x2x4xf32>
  return %r : f32
}
