func.func @fully_insert_to_vector_overlap_2(%dest : vector<2x2xi64>, %src1 : i64, %src2 : i64, %src3 : vector<2xi64>, %src4 : vector<2xi64>) -> vector<2x2xi64> {
  %v0 = vector.insert %src1, %dest[0, 0] : i64 into vector<2x2xi64>
  %v1 = vector.insert %src2, %v0[0, 1] : i64 into vector<2x2xi64>
  %v2 = vector.insert %src3, %v1[0] : vector<2xi64> into vector<2x2xi64>
  %v3 = vector.insert %src4, %v2[1] : vector<2xi64> into vector<2x2xi64>
  return %v3 : vector<2x2xi64>
}
