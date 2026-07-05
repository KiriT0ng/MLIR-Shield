func.func @fold_extract(%arg0 : index) -> (f32, f16, f16, i32, complex<f32>, i32) {
  %const_0 = arith.constant 0 : index
  %const_1 = arith.constant 1 : index
  %const_3 = arith.constant 3 : index

  // Fold an extract into a splat.
  %0 = arith.constant dense<4.0> : tensor<4xf32>
  %ext_1 = tensor.extract %0[%arg0] : tensor<4xf32>

  // Fold an extract into a sparse with a sparse index.
  %1 = arith.constant sparse<[[0, 0, 0], [1, 1, 1]],  [-5.0, -2.0]> : tensor<4x4x4xf16>
  %ext_2 = tensor.extract %1[%const_1, %const_1, %const_1] : tensor<4x4x4xf16>

  // Fold an extract into a sparse with a non sparse index.
  %2 = arith.constant sparse<[[1, 1, 1]],  [-2.0]> : tensor<2x2x2xf16>
  %ext_3 = tensor.extract %2[%const_0, %const_0, %const_0] : tensor<2x2x2xf16>

  // Fold an extract into a dense tensor.
  %3 = arith.constant dense<[[[1, -2, 1, 36]], [[0, 2, -1, 64]]]> : tensor<2x1x4xi32>
  %ext_4 = tensor.extract %3[%const_1, %const_0, %const_3] : tensor<2x1x4xi32>

  // Fold an extract into a complex constant.
  %4 = arith.constant dense<(1.2, 2.3)> : tensor<complex<f32>>
  %ext_5 = tensor.extract %4[] : tensor<complex<f32>>

  // Fold an extract after an insert.
  %c4_i32 = arith.constant 4 : i32
  %5 = arith.constant dense<[[1, 3], [0, 2]]> : tensor<2x2xi32>
  %inserted = tensor.insert %c4_i32 into %5[%const_1, %const_0] : tensor<2x2xi32>
  %ext_6 = tensor.extract %inserted[%const_1, %const_0] : tensor<2x2xi32>

  return %ext_1, %ext_2, %ext_3, %ext_4, %ext_5, %ext_6 : f32, f16, f16, i32, complex<f32>, i32
}
