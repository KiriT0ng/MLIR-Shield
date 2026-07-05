func.func @fold_tensor_cast_into_forall_non_sequential_writes(
    %arg0: tensor<8x32xf32>, %arg1: tensor<8x32xf32>) -> (tensor<?x32xf32>, tensor<?x32xf32>) {
  %c8 = arith.constant 8 : index
  %c32 = arith.constant 32 : index
  %init = tensor.empty(%c32) : tensor<?x32xf32>
  %0:2 = scf.forall (%tidx) in (4) shared_outs(%arg2 = %init, %arg3 = %init)
      -> (tensor<?x32xf32>, tensor<?x32xf32>) {
    %pos = arith.muli %c8, %tidx : index
    scf.forall.in_parallel {
      // Write %arg0 to %arg3 (second shared output).
      tensor.parallel_insert_slice %arg0 into %arg3[%pos, 0] [8, 32] [1, 1]
          : tensor<8x32xf32> into tensor<?x32xf32>
      // Write %arg1 to %arg2 (first shared output).
      tensor.parallel_insert_slice %arg1 into %arg2[%pos, 0] [8, 32] [1, 1]
          : tensor<8x32xf32> into tensor<?x32xf32>
    }
  }
  // %0#0 contains %arg1 data; %0#1 contains %arg0 data.
  return %0#0, %0#1 : tensor<?x32xf32>, tensor<?x32xf32>
}
