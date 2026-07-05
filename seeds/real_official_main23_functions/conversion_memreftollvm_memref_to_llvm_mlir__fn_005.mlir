func.func @distinct_objects(%arg0: memref<?xf16>, %arg1: memref<?xf32>, %arg2: memref<?xf64>) -> (memref<?xf16>, memref<?xf32>, memref<?xf64>) {
  %1, %2, %3 = memref.distinct_objects %arg0, %arg1, %arg2 : memref<?xf16>, memref<?xf32>, memref<?xf64>
  return %1, %2, %3 : memref<?xf16>, memref<?xf32>, memref<?xf64>
}
