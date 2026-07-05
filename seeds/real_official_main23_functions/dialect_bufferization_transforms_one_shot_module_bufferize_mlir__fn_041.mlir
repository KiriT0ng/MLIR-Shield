func.func @custom_types_bar(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64> {
  %call = func.call @custom_types_foo(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>

  %out = "test.dummy_tensor_op"(%call) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64>

  return %out : !test.test_tensor<[4, 8], f64>
}
