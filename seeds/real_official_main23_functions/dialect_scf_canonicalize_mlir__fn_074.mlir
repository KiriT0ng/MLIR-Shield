func.func private @foo()->()
  func.func private @execute_region_multiple_yields_different_operands() -> (memref<1x60xui8>, memref<1x120xui8>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>  
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>  
    %1, %2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {
      %c = "test.cmp"() : () -> i1
      cf.cond_br %c, ^bb2, ^bb3
    ^bb2:    
      func.call @foo():()->()
      scf.yield %alloc, %alloc_1 : memref<1x60xui8>, memref<1x120xui8>
    ^bb3: 
      func.call @foo():()->()   
      scf.yield %alloc, %alloc_2 : memref<1x60xui8>, memref<1x120xui8>
    }  
    return %1, %2 : memref<1x60xui8>, memref<1x120xui8>
  }
