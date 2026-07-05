func.func @insert_strided_slice_f32_2d_into_2d_scalable(%a: vector<2x[2]xf32>, %b: vector<4x[2]xf32>) -> vector<4x[2]xf32> {
  %0 = vector.insert_strided_slice %a, %b {offsets = [2, 0], strides = [1, 1]} : vector<2x[2]xf32> into vector<4x[2]xf32>
  return %0 : vector<4x[2]xf32>
}
