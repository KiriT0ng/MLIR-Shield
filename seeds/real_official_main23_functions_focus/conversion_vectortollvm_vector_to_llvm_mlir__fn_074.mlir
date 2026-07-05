func.func @insert_strided_slice_f32_2d_into_3d_scalable(%b: vector<4x[4]xf32>, %c: vector<4x4x[4]xf32>) -> vector<4x4x[4]xf32> {
  %0 = vector.insert_strided_slice %b, %c {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x[4]xf32> into vector<4x4x[4]xf32>
  return %0 : vector<4x4x[4]xf32>
}
