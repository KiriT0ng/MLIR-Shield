func.func @bitcast_i8_to_i32() -> (vector<4xi32>, vector<4xi32>) {
  %cst0 = arith.constant dense<0> : vector<16xi8> // bit pattern: 0x00
  %cst1 = arith.constant dense<160> : vector<16xi8> // bit pattern: 0xA0
  %cast0 = vector.bitcast %cst0: vector<16xi8> to vector<4xi32>
  %cast1 = vector.bitcast %cst1: vector<16xi8> to vector<4xi32>
  return %cast0, %cast1: vector<4xi32>, vector<4xi32>
}
