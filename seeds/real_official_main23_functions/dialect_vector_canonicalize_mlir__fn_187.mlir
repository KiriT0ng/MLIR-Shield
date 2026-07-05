func.func @negative_partially_insert_vector_to_vector(%dest : vector<2x2xi64>, %src1 : vector<2xi64>, %src2 : i64) -> vector<2x2xi64> {
  %v1 = vector.insert %src1, %dest[0] : vector<2xi64> into vector<2x2xi64>
  %v2 = vector.insert %src2, %v1[0, 0] : i64 into vector<2x2xi64>
  return %v2 : vector<2x2xi64>
}
