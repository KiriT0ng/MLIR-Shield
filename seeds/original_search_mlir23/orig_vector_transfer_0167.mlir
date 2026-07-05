func.func @orig_vector_transfer_167(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %i: index, %j: index) -> vector<4x2xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %v = vector.transfer_read %arg0[%i, %j], %cst {in_bounds = [false, false]} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<4x2xf32>
  return %v : vector<4x2xf32>
}
