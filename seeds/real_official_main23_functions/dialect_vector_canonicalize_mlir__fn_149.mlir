func.func @extract_strided_slice_3d_constant() -> (vector<1x2x2xi32>, vector<1x1x2xi32>, vector<2x1x2xi32>, vector<1x1x1xi32>) {
  %cst = arith.constant dense<[[[0, 1], [2, 3]], [[4, 5], [6, 7]], [[8, 9], [10, 11]]]> : vector<3x2x2xi32>
  %a = vector.extract_strided_slice %cst
   {offsets = [2], sizes = [1], strides = [1]} : vector<3x2x2xi32> to vector<1x2x2xi32>
  %b = vector.extract_strided_slice %cst
   {offsets = [0, 1], sizes = [1, 1], strides = [1, 1]} : vector<3x2x2xi32> to vector<1x1x2xi32>
  %c = vector.extract_strided_slice %cst
   {offsets = [1, 1, 0], sizes = [2, 1, 2], strides = [1, 1, 1]} : vector<3x2x2xi32> to vector<2x1x2xi32>
  %d = vector.extract_strided_slice %cst
   {offsets = [2, 1, 1], sizes = [1, 1, 1], strides = [1, 1, 1]} : vector<3x2x2xi32> to vector<1x1x1xi32>
  return %a, %b, %c, %d : vector<1x2x2xi32>, vector<1x1x2xi32>, vector<2x1x2xi32>, vector<1x1x1xi32>
}
