func.func @extract_strided_slice_2d_constant() -> (vector<1x1xi32>, vector<1x2xi32>, vector<2x2xi32>) {
  %cst = arith.constant dense<[[0, 1, 2], [3, 4, 5]]> : vector<2x3xi32>
  %a = vector.extract_strided_slice %cst
   {offsets = [0, 0], sizes = [1, 1], strides = [1, 1]} : vector<2x3xi32> to vector<1x1xi32>
  %b = vector.extract_strided_slice %cst
   {offsets = [1, 1], sizes = [1, 2], strides = [1, 1]} : vector<2x3xi32> to vector<1x2xi32>
  %c = vector.extract_strided_slice %cst
   {offsets = [0, 1], sizes = [2, 2], strides = [1, 1]} : vector<2x3xi32> to vector<2x2xi32>
  return %a, %b, %c : vector<1x1xi32>, vector<1x2xi32>, vector<2x2xi32>
}
