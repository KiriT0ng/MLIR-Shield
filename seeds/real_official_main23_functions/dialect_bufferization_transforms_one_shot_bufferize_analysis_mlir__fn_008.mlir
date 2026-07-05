func.func @bbarg_of_unknown_op_2(%f: f32) {
  %0 = tensor.empty() : tensor<10xf32>
  %1 = linalg.fill ins(%f : f32) outs(%0 : tensor<10xf32>) -> tensor<10xf32>

  // The op is not bufferizable because %1 is assumed to alias with %arg1.
  // BlockArguments are considered "not writable" by default. So %1 is also
  // considered "not writable".

  "dummy.dummy_op"(%1) ({
  ^bb0(%arg1: tensor<10xf32>):
    "dummy.another_op"(%arg1) : (tensor<10xf32>) -> ()
  }) : (tensor<10xf32>) -> ()
  return
}
