func.func @fully_insert_to_vector_overlap_1(%dest : vector<2x2xi64>, %src1 : vector<2xi64>, %src2 : i64) -> vector<2x2xi64> {
  %v0 = vector.insert %src2, %dest[0, 0] : i64 into vector<2x2xi64>
  %v1 = vector.insert %src1, %v0[0] : vector<2xi64> into vector<2x2xi64>
  %v2 = vector.insert %src1, %v1[1] : vector<2xi64> into vector<2x2xi64>
  %v3 = vector.insert %src2, %v2[1, 1] : i64 into vector<2x2xi64>
  return %v3 : vector<2x2xi64>
}
