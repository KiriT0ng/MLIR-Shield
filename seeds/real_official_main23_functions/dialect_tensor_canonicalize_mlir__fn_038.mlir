func.func @out_of_bounds_extract_slice(%t: tensor<5xf32>) -> tensor<?xf32> {
  %c10 = arith.constant 10 : index
  %r = tensor.extract_slice %t[0] [%c10] [1] : tensor<5xf32> to tensor<?xf32>
  return %r : tensor<?xf32>
}
