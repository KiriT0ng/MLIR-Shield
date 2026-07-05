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
