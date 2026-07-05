func.func @custom_types(%arg: !test.test_tensor<[4, 4], f64>)
    -> (!test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>) {
  %out1 = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64>

  %alloc = "test.create_tensor_op"() : () -> !test.test_tensor<[4, 4], f64>
  %out2 = "test.dummy_tensor_op"(%alloc) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64>

  return %out1, %out2 :
    !test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>
}
