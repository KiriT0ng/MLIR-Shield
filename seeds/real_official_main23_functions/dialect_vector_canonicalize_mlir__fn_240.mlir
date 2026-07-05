func.func @transpose_from_elements_1d(%el_0: i32, %el_1: i32) -> vector<2xi32> {
  %v = vector.from_elements %el_0, %el_1 : vector<2xi32>
  %t = vector.transpose %v, [0] : vector<2xi32> to vector<2xi32>
  return %t : vector<2xi32>
}
