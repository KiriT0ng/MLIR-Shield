func.func @allocator(%arg0 : memref<memref<?xi32>>, %arg1 : index)  {
  %0 = memref.alloc(%arg1) : memref<?xi32>
  memref.store %0, %arg0[] : memref<memref<?xi32>>
  return
}
