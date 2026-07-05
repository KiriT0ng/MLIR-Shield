func.func @invalid_slice_ops(%t: tensor<?xf32>, %t2: tensor<?xf32>) -> tensor<?xf32> {
  %c = arith.constant -5 : index
  %0 = tensor.extract_slice %t[0][%c][1] : tensor<?xf32> to tensor<?xf32>
  %1 = tensor.insert_slice %0 into %t2[2][%c][1] : tensor<?xf32> into tensor<?xf32>
  return %1 : tensor<?xf32>
}
