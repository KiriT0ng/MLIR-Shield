func.func @insert_strided_slice_splatlike(%x: f32) -> (vector<8x16xf32>) {
  %splat0 = vector.broadcast %x : f32 to vector<4x4xf32>
  %splat1 = vector.broadcast %x : f32 to vector<8x16xf32>
  %0 = vector.insert_strided_slice %splat0, %splat1 {offsets = [2, 2], strides = [1, 1]}
    : vector<4x4xf32> into vector<8x16xf32>
  return %0 : vector<8x16xf32>
}
