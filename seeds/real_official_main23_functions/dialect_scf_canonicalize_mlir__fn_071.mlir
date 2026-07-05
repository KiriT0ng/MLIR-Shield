func.func private @foo()->()
func.func private @execute_region_yeilding_external_value() -> memref<1x60xui8> {
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
  %1 = scf.execute_region -> memref<1x60xui8> no_inline {    
    func.call @foo():()->()
    scf.yield %alloc: memref<1x60xui8>
  }  
  return %1 : memref<1x60xui8>
}
