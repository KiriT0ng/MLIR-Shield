#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @max_lower_bound(%M: memref<2048x516xf64>, %i : index, %j : index) {
  affine.for %ii = 0 to 2048 {
    affine.for %jj = max #lb()[%i, %j] to min #ub()[%i, %j] {
      affine.load %M[%ii, %jj] : memref<2048x516xf64>
    }
  }
  return
}
