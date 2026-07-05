func.func @fold_insert_use_chain(%arg : vector<4x4xf32>, %val : f32, %pos: index) -> vector<4x4xf32> {
  %v_0 = vector.insert %val, %arg[%pos, 0] : f32 into vector<4x4xf32>
  %v_1 = vector.insert %val, %v_0[%pos, 0] : f32 into vector<4x4xf32>
  %v_2 = vector.insert %val, %v_1[%pos, 0] : f32 into vector<4x4xf32>
  return %v_2 : vector<4x4xf32>
}
