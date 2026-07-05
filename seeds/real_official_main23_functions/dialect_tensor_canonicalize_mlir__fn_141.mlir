func.func @generate_negative_size_verifies() -> tensor<?x8xi32> {
  %cst = arith.constant 0 : i32
  %c0 = arith.constant 0 : index
  %size = affine.max affine_map<(d0) -> (d0 mod 64 - 8)>(%c0)
  %tensor = tensor.generate %size {
  ^bb0(%arg0: index, %arg1: index):
    tensor.yield %cst : i32
  } : tensor<?x8xi32>
  return %tensor : tensor<?x8xi32>
}
