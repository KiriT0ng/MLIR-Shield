// Run fuzzer with different seeds.

func.func @buffer_not_deallocated(%t : tensor<?xf32>, %c : i1) -> tensor<?xf32> {
  %r = scf.if %c -> tensor<?xf32> {
    %sz = "test.some_op"() : () -> (index)
    %0 = bufferization.alloc_tensor(%sz) : tensor<?xf32>
    scf.yield %0 : tensor<?xf32>
  } else {
    scf.yield %t : tensor<?xf32>
  }
  return %r : tensor<?xf32>
}

// -----

func.func @write_to_alloc_tensor_or_readonly_tensor(%arg0: tensor<i32>,
                                                    %cond: i1, %val: i32)
  -> tensor<i32>
{
  %3 = scf.if %cond -> (tensor<i32>) {
    scf.yield %arg0 : tensor<i32>
  } else {
    %7 = bufferization.alloc_tensor() : tensor<i32>
    %8 = tensor.insert %val into %7[] : tensor<i32>
    scf.yield %8 : tensor<i32>
  }
  return %3 : tensor<i32>
}
