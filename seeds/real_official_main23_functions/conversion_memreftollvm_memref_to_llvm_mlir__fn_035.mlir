func.func @alloca_unconvertable_memory_space() {
  %alloca = memref.alloca() : memref<1x32x33xi32, #spirv.storage_class<StorageBuffer>>
  func.return
}
