// Permutation maps used in vectorization.

func.func @vec2d(%A : memref<?x?x?xf32>) {
   %c0 = arith.constant 0 : index
   %c1 = arith.constant 1 : index
   %c2 = arith.constant 2 : index
   %M = memref.dim %A, %c0 : memref<?x?x?xf32>
   %N = memref.dim %A, %c1 : memref<?x?x?xf32>
   %P = memref.dim %A, %c2 : memref<?x?x?xf32>
   // Example:
   // affine.for %{{.*}} = 0 to %{{.*}} {
   //   affine.for %{{.*}} = 0 to %{{.*}} step 32 {
   //     affine.for %{{.*}} = 0 to %{{.*}} step 256 {
   //       %{{.*}} = "vector.transfer_read"(%{{.*}}, %{{.*}}, %{{.*}}, %{{.*}}) : (memref<?x?x?xf32>, index, index, index) -> vector<32x256xf32>
   affine.for %i0 = 0 to %M {
     affine.for %i1 = 0 to %N {
       affine.for %i2 = 0 to %P {
         %a2 = affine.load %A[%i0, %i1, %i2] : memref<?x?x?xf32>
       }
     }
   }
   // For the case: --test-fastest-varying=1 --test-fastest-varying=0 no
   // vectorization happens because of loop nesting order .
   affine.for %i3 = 0 to %M {
     affine.for %i4 = 0 to %N {
       affine.for %i5 = 0 to %P {
         %a5 = affine.load %A[%i4, %i5, %i3] : memref<?x?x?xf32>
       }
     }
   }
   return
}

func.func @vector_add_2d(%M : index, %N : index) -> f32 {
  %A = memref.alloc (%M, %N) : memref<?x?xf32, 0>
  %B = memref.alloc (%M, %N) : memref<?x?xf32, 0>
  %C = memref.alloc (%M, %N) : memref<?x?xf32, 0>
  %f1 = arith.constant 1.0 : f32
  %f2 = arith.constant 2.0 : f32
  affine.for %i0 = 0 to %M {
    affine.for %i1 = 0 to %N {
      // non-scoped %f1
      affine.store %f1, %A[%i0, %i1] : memref<?x?xf32, 0>
    }
  }
  affine.for %i2 = 0 to %M {
    affine.for %i3 = 0 to %N {
      // non-scoped %f2
      affine.store %f2, %B[%i2, %i3] : memref<?x?xf32, 0>
    }
  }
  affine.for %i4 = 0 to %M {
    affine.for %i5 = 0 to %N {
      //
      %a5 = affine.load %A[%i4, %i5] : memref<?x?xf32, 0>
      %b5 = affine.load %B[%i4, %i5] : memref<?x?xf32, 0>
      %s5 = arith.addf %a5, %b5 : f32
      // non-scoped %f1
      %s6 = arith.addf %s5, %f1 : f32
      // non-scoped %f2
      %s7 = arith.addf %s5, %f2 : f32
      // diamond dependency.
      %s8 = arith.addf %s7, %s6 : f32
      affine.store %s8, %C[%i4, %i5] : memref<?x?xf32, 0>
    }
  }
  %c7 = arith.constant 7 : index
  %c42 = arith.constant 42 : index
  %res = affine.load %C[%c7, %c42] : memref<?x?xf32, 0>
  return %res : f32
}

func.func @vectorize_matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %M = memref.dim %arg0, %c0 : memref<?x?xf32>
  %K = memref.dim %arg0, %c1 : memref<?x?xf32>
  %N = memref.dim %arg2, %c1 : memref<?x?xf32>
  affine.for %i0 = affine_map<(d0) -> (d0)>(%c0) to affine_map<(d0) -> (d0)>(%M) {
    affine.for %i1 = affine_map<(d0) -> (d0)>(%c0) to affine_map<(d0) -> (d0)>(%N) {
      %cst = arith.constant 0.000000e+00 : f32
      affine.store %cst, %arg2[%i0, %i1] : memref<?x?xf32>
    }
  }
  affine.for %i2 = affine_map<(d0) -> (d0)>(%c0) to affine_map<(d0) -> (d0)>(%M) {
    affine.for %i3 = affine_map<(d0) -> (d0)>(%c0) to affine_map<(d0) -> (d0)>(%N) {
      affine.for %i4 = affine_map<(d0) -> (d0)>(%c0) to affine_map<(d0) -> (d0)>(%K) {
        %6 = affine.load %arg1[%i4, %i3] : memref<?x?xf32>
        %7 = affine.load %arg0[%i2, %i4] : memref<?x?xf32>
        %8 = arith.mulf %7, %6 : f32
        %9 = affine.load %arg2[%i2, %i3] : memref<?x?xf32>
        %10 = arith.addf %9, %8 : f32
        affine.store %10, %arg2[%i2, %i3] : memref<?x?xf32>
      }
    }
  }
  return
}
