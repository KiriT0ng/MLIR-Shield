func.func private @foo()->()
func.func private @execute_region_yeilding_external_and_local_values() -> (memref<1x60xui8>, memref<1x120xui8>) {
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
  %1, %2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {    
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>
    func.call @foo():()->()
    scf.yield %alloc, %alloc_1: memref<1x60xui8>,  memref<1x120xui8>
  }  
  return %1, %2 : memref<1x60xui8>, memref<1x120xui8>
}
