func.func @all_true_vector_mask(%ta : tensor<3x4xf32>) -> vector<3x4xf32> {
  %c0 = arith.constant 0 : index
  %cf0 = arith.constant 0.0 : f32
  %all_true = vector.constant_mask [3, 4] : vector<3x4xi1>
  %0 = vector.mask %all_true { vector.transfer_read %ta[%c0, %c0], %cf0 : tensor<3x4xf32>, vector<3x4xf32> } : vector<3x4xi1> -> vector<3x4xf32>
  return %0 : vector<3x4xf32>
}
