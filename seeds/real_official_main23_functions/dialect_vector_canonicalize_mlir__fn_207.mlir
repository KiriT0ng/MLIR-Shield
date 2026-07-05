func.func @extract_strided_slice_of_constant_mask() -> vector<5x7xi1>{
  %c4 = arith.constant 4 : index
  %c10 = arith.constant 10 : index
  %mask = vector.create_mask %c10, %c4 : vector<12x7xi1>
  %res = vector.extract_strided_slice %mask {offsets = [3], sizes = [5], strides = [1]} : vector<12x7xi1> to vector<5x7xi1>
  return %res : vector<5x7xi1>
}
