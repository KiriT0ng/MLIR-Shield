func.func @no_fold_insert_use_chain_mismatch_static_position(%arg : vector<4xf32>, %val : f32) -> vector<4xf32> {
  %v_0 = vector.insert %val, %arg[0] : f32 into vector<4xf32>
  %v_1 = vector.insert %val, %v_0[1] : f32 into vector<4xf32>
  return %v_1 : vector<4xf32>
}
