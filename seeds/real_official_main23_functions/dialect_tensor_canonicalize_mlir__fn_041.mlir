func.func @out_of_bounds_insert_slice(%src: tensor<5xf32>, %dst: tensor<10xf32>, %sz: index) -> tensor<10xf32> {
  %src2 = tensor.cast %src : tensor<5xf32> to tensor<?xf32>
  %r = tensor.insert_slice %src2 into %dst[7] [%sz] [1] : tensor<?xf32> into tensor<10xf32>
  return %r : tensor<10xf32>
}
