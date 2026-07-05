func.func @extract_from_elements_complex_f() -> tensor<3xcomplex<f32>> {
  %c1 = arith.constant dense<(1.2, 2.3)> : tensor<complex<f32>>
  %complex1 = tensor.extract %c1[] : tensor<complex<f32>>
  %c2 = arith.constant dense<(3.2, 2.1)> : tensor<complex<f32>>
  %complex2 = tensor.extract %c2[] : tensor<complex<f32>>
  %tensor = tensor.from_elements %complex1, %complex2, %complex1 : tensor<3xcomplex<f32>>
  return %tensor : tensor<3xcomplex<f32>>
}
