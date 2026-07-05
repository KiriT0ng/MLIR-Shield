func.func @extract_strided_fold_insert(%a: vector<2x8xf32>, %b: vector<1x4xf32>,
                                  %c : vector<1x4xf32>) -> (vector<1x1xf32>) {
  %0 = vector.insert_strided_slice %b, %a {offsets = [0, 1], strides = [1, 1]}
    : vector<1x4xf32> into vector<2x8xf32>
  %1 = vector.insert_strided_slice %c, %0 {offsets = [1, 0], strides = [1, 1]}
    : vector<1x4xf32> into vector<2x8xf32>
  %2 = vector.extract_strided_slice %1
      {offsets = [0, 1], sizes = [1, 1], strides = [1, 1]}
        : vector<2x8xf32> to vector<1x1xf32>
  return %2 : vector<1x1xf32>
}
