#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @arbitrary_memory_space() {
  %alloc = memref.alloc() : memref<256x8xi8, #spirv.storage_class<StorageBuffer>>
  affine.for %arg0 = 0 to 32 step 4 {
    %0 = affine.apply #map(%arg0)
    affine.for %arg1 = 0 to 8 step 2 {
      %1 = affine.apply #map(%arg1)
      affine.for %arg2 = 0 to 8 step 2 {
        %2 = affine.apply #map(%arg2)
        %3 = affine.load %alloc[%0, %1] : memref<256x8xi8, #spirv.storage_class<StorageBuffer>>
        affine.store %3, %alloc[%0, %2] : memref<256x8xi8, #spirv.storage_class<StorageBuffer>>
      }
    }
  }
  return
}
