func.func @cast_transfers(%A: tensor<4x8xf32>) -> (vector<4x8xf32>) {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32
  %0 = tensor.cast %A : tensor<4x8xf32> to tensor<?x?xf32>

  %1 = vector.transfer_read %0[%c0, %c0], %f0 : tensor<?x?xf32>, vector<4x8xf32>

  return %1 : vector<4x8xf32>
}
