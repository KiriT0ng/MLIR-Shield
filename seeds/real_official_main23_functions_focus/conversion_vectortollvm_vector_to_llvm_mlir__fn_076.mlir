func.func @insert_strided_index_slice_index_2d_into_3d_scalable(%b: vector<4x[4]xindex>, %c: vector<4x4x[4]xindex>) -> vector<4x4x[4]xindex> {
  %0 = vector.insert_strided_slice %b, %c {offsets = [2, 0, 0], strides = [1, 1]} : vector<4x[4]xindex> into vector<4x4x[4]xindex>
  return %0 : vector<4x4x[4]xindex>
}
