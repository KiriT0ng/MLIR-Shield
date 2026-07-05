func.func @negative_intermediate_insert_multiple_users(%dest : vector<3xi64>, %src1 : i64, %src2 : i64, %src3 : i64, %src4 : i64) -> (vector<3xi64>, vector<3xi64>) {
  %v1 = vector.insert %src1, %dest[0] : i64 into vector<3xi64>
  %v2 = vector.insert %src2, %v1[1] : i64 into vector<3xi64>
  %v3_0 = vector.insert %src3, %v2[2] : i64 into vector<3xi64>
  %v3_1 = vector.insert %src4, %v2[2] : i64 into vector<3xi64>
  return %v3_0, %v3_1 : vector<3xi64>, vector<3xi64>
}
