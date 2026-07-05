func.func @extract_strided_broadcast5(%arg0: vector<2x1xf32>) -> vector<2x4xf32> {
 %0 = vector.broadcast %arg0 : vector<2x1xf32> to vector<2x8xf32>
 %1 = vector.extract_strided_slice %0
      {offsets = [0, 4], sizes = [2, 4], strides = [1, 1]}
      : vector<2x8xf32> to vector<2x4xf32>
  return %1 : vector<2x4xf32>
}
