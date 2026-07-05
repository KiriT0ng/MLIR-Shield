func.func @fma(%vec_1d: vector<8xf32>, %vec_2d: vector<2x4xf32>, %vec_3d: vector<1x1x1xf32>, %vec_0d: vector<f32>) -> (vector<8xf32>, vector<2x4xf32>, vector<1x1x1xf32>, vector<f32>) {
  %0 = vector.fma %vec_1d, %vec_1d, %vec_1d : vector<8xf32>

  %1 = vector.fma %vec_2d, %vec_2d, %vec_2d : vector<2x4xf32>

  %2 = vector.fma %vec_3d, %vec_3d, %vec_3d : vector<1x1x1xf32>

  %3 = vector.fma %vec_0d, %vec_0d, %vec_0d : vector<f32>

  return %0, %1, %2, %3: vector<8xf32>, vector<2x4xf32>, vector<1x1x1xf32>, vector<f32>
}
