func.func @extract_from_elements_complex_i() -> tensor<3xcomplex<i32>> {
  %c1 = arith.constant dense<(1, 2)> : tensor<complex<i32>>
  %complex1 = tensor.extract %c1[] : tensor<complex<i32>>
  %c2 = arith.constant dense<(3, 2)> : tensor<complex<i32>>
  %complex2 = tensor.extract %c2[] : tensor<complex<i32>>
  %tensor = tensor.from_elements %complex1, %complex2, %complex1 : tensor<3xcomplex<i32>>
  return %tensor : tensor<3xcomplex<i32>>
}
