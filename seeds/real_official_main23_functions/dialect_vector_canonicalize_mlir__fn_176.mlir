func.func @shuffle_poison_unused(%1: vector<2xi32>) -> vector<4xi32> {
  %0 = ub.poison : vector<2xi32>
  %r = vector.shuffle %0, %1 [0, 1, -1, -1] : vector<2xi32>, vector<2xi32>
  return %r : vector<4xi32>
}
