func.func @result_type_mismatch(%c: i1) -> tensor<5xf32> {
  %t = tensor.empty() : tensor<10xf32>
  cf.cond_br %c, ^bb1, ^bb2
^bb1:
  %0 = tensor.extract_slice %t[0][5][2] : tensor<10xf32> to tensor<5xf32>
  return %0 : tensor<5xf32>
^bb2:
  %1 = tensor.extract_slice %t[2][5][1] : tensor<10xf32> to tensor<5xf32>
  return %1 : tensor<5xf32>
}
