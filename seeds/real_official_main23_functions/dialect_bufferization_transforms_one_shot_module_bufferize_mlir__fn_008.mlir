func.func @func_without_tensor_args(%v : vector<10xf32>) -> () {
  %0 = bufferization.alloc_tensor() : tensor<10xf32>

  %c0 = arith.constant 0 : index
  %1 = vector.transfer_write %v, %0[%c0] : vector<10xf32>, tensor<10xf32>

  %cst = arith.constant 0.0 : f32
  %r = vector.transfer_read %1[%c0], %cst : tensor<10xf32>, vector<11xf32>

  vector.print %r : vector<11xf32>
  return
}
