func.func @out_of_bounds_insert_slice(%src: tensor<5xf32>, %dst: tensor<10xf32>, %sz: index) -> tensor<?xf32> {
  %dst2 = tensor.cast %dst : tensor<10xf32> to tensor<?xf32>
  %r = tensor.insert_slice %src into %dst2[7] [5] [1] : tensor<5xf32> into tensor<?xf32>
  return %r : tensor<?xf32>
}
