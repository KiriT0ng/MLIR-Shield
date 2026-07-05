func.func @insert_strided_slice_f32_2d_into_3d_scalable(%arg0: vector<2x[4]xf32>, %arg1: vector<16x4x[4]xf32>) -> vector<16x4x[4]xf32> {
  %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [3, 2, 0], strides = [1, 1]}:
        vector<2x[4]xf32> into vector<16x4x[4]xf32>
  return %0 : vector<16x4x[4]xf32>
}
