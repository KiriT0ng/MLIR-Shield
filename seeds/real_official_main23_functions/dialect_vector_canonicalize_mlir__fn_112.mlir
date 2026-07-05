func.func @extract_strided_broadcast3(%arg0: vector<1xf32>) -> vector<1x4xf32> {
 %0 = vector.broadcast %arg0 : vector<1xf32> to vector<1x8xf32>
 %1 = vector.extract_strided_slice %0
      {offsets = [0, 4], sizes = [1, 4], strides = [1, 1]}
      : vector<1x8xf32> to vector<1x4xf32>
  return %1 : vector<1x4xf32>
}
