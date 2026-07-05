func.func private @custom_types_identity_2d(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64> {
  %out = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>
  return %out : !test.test_tensor<[4, 4], f64>
}
