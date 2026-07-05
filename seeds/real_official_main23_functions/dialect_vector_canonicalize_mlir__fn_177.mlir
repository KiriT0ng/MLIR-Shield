func.func @fold_poison_into_mask(%1: vector<2xi32>) -> vector<4xi32> {
  %0 = ub.poison : vector<2xi32>
  %r = vector.shuffle %0, %1 [0, 1, 2, 1] : vector<2xi32>, vector<2xi32>
  return %r : vector<4xi32>
}
