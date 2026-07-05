func.func @out_of_bounds_extract_slice(%t: tensor<5xf32>) -> tensor<10xf32> {
  %t2 = tensor.cast %t : tensor<5xf32> to tensor<?xf32>
  %r = tensor.extract_slice %t2 [0][10][1] : tensor<?xf32> to tensor<10xf32>
  return %r : tensor<10xf32>
}
