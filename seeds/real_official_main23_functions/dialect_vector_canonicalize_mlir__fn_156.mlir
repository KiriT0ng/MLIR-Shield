func.func @extract_extract_strided2(%A: vector<2x4xf32>)
  -> (vector<4xf32>) {
 %0 = vector.extract_strided_slice %A {offsets = [1, 0], sizes = [1, 4], strides = [1, 1]} : vector<2x4xf32> to vector<1x4xf32>
 %1 = vector.extract %0[0] : vector<4xf32> from vector<1x4xf32>
 return %1 : vector<4xf32>
}
