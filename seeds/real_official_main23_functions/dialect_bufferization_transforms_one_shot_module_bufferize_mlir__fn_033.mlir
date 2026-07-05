func.func @foo(%t: tensor<5xf32>) -> tensor<5xf32> {
  // We are conservative around recursive functions. The analysis cannot handle
  // them, so we have to assume the op operand of the call op bufferizes to a
  // memory read and write. This causes a copy in this test case.
  %0 = call @foo(%t) : (tensor<5xf32>) -> (tensor<5xf32>)

  %c0 = arith.constant 0 : index
  %extr = tensor.extract %t[%c0] : tensor<5xf32>
  vector.print %extr : f32

  return %0 : tensor<5xf32>
}
