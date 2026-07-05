func.func @distinct_objects_noop(%arg0: memref<?xf16>) -> memref<?xf16> {
// 1-operand version is noop
  %1 = memref.distinct_objects %arg0 : memref<?xf16>
  return %1 : memref<?xf16>
}
