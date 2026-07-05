func.func @insert_strided_2d_constant() ->
  (vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>) {
  %vcst = arith.constant dense<[[0, 1], [2, 3], [4, 5]]> : vector<3x2xi32>
  %cst_1 = arith.constant dense<9> : vector<1xi32>
  %cst_2 = arith.constant dense<[18, 19]> : vector<2xi32>
  %cst_3 = arith.constant dense<[[28, 29], [38, 39]]> : vector<2x2xi32>
  %a = vector.insert_strided_slice %cst_1, %vcst {offsets = [1, 0], strides = [1]} : vector<1xi32> into vector<3x2xi32>
  %b = vector.insert_strided_slice %cst_1, %vcst {offsets = [2, 1], strides = [1]} : vector<1xi32> into vector<3x2xi32>
  %c = vector.insert_strided_slice %cst_2, %vcst {offsets = [0, 0], strides = [1]} : vector<2xi32> into vector<3x2xi32>
  %d = vector.insert_strided_slice %cst_2, %vcst {offsets = [1, 0], strides = [1]} : vector<2xi32> into vector<3x2xi32>
  %e = vector.insert_strided_slice %cst_2, %vcst {offsets = [2, 0], strides = [1]} : vector<2xi32> into vector<3x2xi32>
  %f = vector.insert_strided_slice %cst_3, %vcst {offsets = [0, 0], strides = [1, 1]} : vector<2x2xi32> into vector<3x2xi32>
  %g = vector.insert_strided_slice %cst_3, %vcst {offsets = [1, 0], strides = [1, 1]} : vector<2x2xi32> into vector<3x2xi32>
  return %a, %b, %c, %d, %e, %f, %g :
    vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>, vector<3x2xi32>
}
