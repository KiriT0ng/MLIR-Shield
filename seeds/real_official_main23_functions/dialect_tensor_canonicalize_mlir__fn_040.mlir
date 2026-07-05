func.func @out_of_bounds_insert_slice(%src: tensor<5xf32>, %dst: tensor<10xf32>) -> tensor<10xf32> {
  %c10 = arith.constant 10 : index
  %r = tensor.insert_slice %src into %dst[%c10] [5] [1] : tensor<5xf32> into tensor<10xf32>
  return %r : tensor<10xf32>
}
