func.func @ind_vector_mask_transfer_write_324(%src: memref<?x?xf32>, %dst: memref<?x?xf32>, %i: index, %j: index, %mask: vector<1x3xi1>) {
  %pad = arith.constant 0.000000e+00 : f32
  %v = vector.transfer_read %src[%i, %j], %pad {in_bounds = [true, true]} : memref<?x?xf32>, vector<1x3xf32>
  vector.mask %mask { vector.transfer_write %v, %dst[%i, %j] {in_bounds = [true, true]} : vector<1x3xf32>, memref<?x?xf32> } : vector<1x3xi1>
  return
}
