func.func @fma_scalable(%vec_1d: vector<[8]xf32>, %vec_2d: vector<2x[4]xf32>, %vec_3d: vector<1x1x[1]xf32>, %vec_0d: vector<f32>) -> (vector<[8]xf32>, vector<2x[4]xf32>, vector<1x1x[1]xf32>) {
  %0 = vector.fma %vec_1d, %vec_1d, %vec_1d : vector<[8]xf32>

  %1 = vector.fma %vec_2d, %vec_2d, %vec_2d : vector<2x[4]xf32>

  %2 = vector.fma %vec_3d, %vec_3d, %vec_3d : vector<1x1x[1]xf32>

  return %0, %1, %2: vector<[8]xf32>, vector<2x[4]xf32>, vector<1x1x[1]xf32>
}
