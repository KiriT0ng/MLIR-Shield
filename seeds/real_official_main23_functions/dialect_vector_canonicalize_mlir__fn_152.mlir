func.func @extract_insert_rank_reduce(%a: vector<4xf32>, %b: vector<8x16xf32>)
  -> f32 {
  %0 = vector.insert_strided_slice %a, %b {offsets = [2, 2], strides = [1]}
    : vector<4xf32> into vector<8x16xf32>
  %2 = vector.extract %0[2, 4] : f32 from vector<8x16xf32>
  return %2 : f32
}
