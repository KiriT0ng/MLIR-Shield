func.func @extract_strided_slice_1d_constant() -> (vector<3xi32>, vector<2xi32>, vector<1xi32>) {
  %cst = arith.constant dense<[0, 1, 2]> : vector<3xi32>
  %a = vector.extract_strided_slice %cst
   {offsets = [0], sizes = [3], strides = [1]} : vector<3xi32> to vector<3xi32>
  %b = vector.extract_strided_slice %cst
   {offsets = [1], sizes = [2], strides = [1]} : vector<3xi32> to vector<2xi32>
  %c = vector.extract_strided_slice %cst
   {offsets = [2], sizes = [1], strides = [1]} : vector<3xi32> to vector<1xi32>
  return %a, %b, %c : vector<3xi32>, vector<2xi32>, vector<1xi32>
}
