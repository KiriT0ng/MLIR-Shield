func.func @insert_strided_1d_constant() ->
  (vector<3xi32>, vector<3xi32>, vector<3xi32>, vector<3xi32>, vector<3xi32>) {
  %vcst = arith.constant dense<[0, 1, 2]> : vector<3xi32>
  %cst_1 = arith.constant dense<4> : vector<1xi32>
  %cst_2 = arith.constant dense<[5, 6]> : vector<2xi32>
  %cst_3 = arith.constant dense<[7, 8, 9]> : vector<3xi32>
  %a = vector.insert_strided_slice %cst_1, %vcst {offsets = [0], strides = [1]} : vector<1xi32> into vector<3xi32>
  %b = vector.insert_strided_slice %cst_1, %vcst {offsets = [2], strides = [1]} : vector<1xi32> into vector<3xi32>
  %c = vector.insert_strided_slice %cst_2, %vcst {offsets = [0], strides = [1]} : vector<2xi32> into vector<3xi32>
  %d = vector.insert_strided_slice %cst_2, %vcst {offsets = [1], strides = [1]} : vector<2xi32> into vector<3xi32>
  %e = vector.insert_strided_slice %cst_3, %vcst {offsets = [0], strides = [1]} : vector<3xi32> into vector<3xi32>
  return %a, %b, %c, %d, %e : vector<3xi32>, vector<3xi32>, vector<3xi32>, vector<3xi32>, vector<3xi32>
}
