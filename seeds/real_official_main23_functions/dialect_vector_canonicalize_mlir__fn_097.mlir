func.func @bitcast_f16_to_f32() -> (vector<4xf32>, vector<4xf32>) {
  %cst0 = arith.constant dense<0.0> : vector<8xf16> // bit pattern: 0x0000
  %cst1 = arith.constant dense<2.0> : vector<8xf16> // bit pattern: 0x4000
  %cast0 = vector.bitcast %cst0: vector<8xf16> to vector<4xf32>
  %cast1 = vector.bitcast %cst1: vector<8xf16> to vector<4xf32>
  return %cast0, %cast1: vector<4xf32>, vector<4xf32>
}
