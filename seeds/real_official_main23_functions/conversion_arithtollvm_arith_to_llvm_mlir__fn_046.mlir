func.func @select_complex(%arg0 : i1, %arg1 : complex<f32>, %arg2 : complex<f32>) -> complex<f32> {
  %0 = arith.select %arg0, %arg1, %arg2 : complex<f32>
  return %0 : complex<f32>
}
