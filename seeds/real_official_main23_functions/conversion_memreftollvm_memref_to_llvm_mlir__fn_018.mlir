func.func @atomic_rmw(%I : memref<10xi32>, %ival : i32, %F : memref<10xf32>, %fval : f32, %i : index) {
  memref.atomic_rmw assign %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw addi %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw maxs %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw mins %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw maxu %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw minu %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw addf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw maximumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw maxnumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw minimumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw minnumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw ori %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw andi %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw xori %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  return
}
