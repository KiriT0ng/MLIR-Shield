#map0 = affine_map<()[s0, s1] -> (1024, s0 - s1)>
#map1 = affine_map<()[s0, s1] -> (64, s0 - s1)>

func.func @for(%outer: index, %A: memref<?xf32>, %B: memref<?xf32>,
          %C: memref<?xf32>, %result: memref<?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = memref.dim %A, %c0 : memref<?xf32>
  %b0 = affine.min #map0()[%d0, %outer]
  scf.for %i0 = %c0 to %b0 step %c1 {
    %B_elem = memref.load %B[%i0] : memref<?xf32>
    %C_elem = memref.load %C[%i0] : memref<?xf32>
    %sum_elem = arith.addf %B_elem, %C_elem : f32
    memref.store %sum_elem, %result[%i0] : memref<?xf32>
  }
  return
}
