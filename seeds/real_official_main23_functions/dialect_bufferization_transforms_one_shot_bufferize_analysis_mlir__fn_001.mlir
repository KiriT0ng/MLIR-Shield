func.func @unknown_op_bbarg_aliasing() {
  %0 = tensor.empty() : tensor<7xf32>

  // %arg0 is not aliasing with %0 because it bufferizes out-of-place.
  "dummy.dummy_op"(%0) ({
  ^bb0(%arg1: tensor<7xf32>):
  }) : (tensor<7xf32>) -> ()
  return
}
