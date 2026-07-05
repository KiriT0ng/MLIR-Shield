func.func @func1() {
    %true = arith.constant true
    %c0 = arith.constant 0 : index
    %c5 = arith.constant 5 : index
    %c11 = arith.constant 11 : index
    %c14 = arith.constant 14 : index
    %c15 = arith.constant 15 : index
    %alloc_249 = memref.alloc() : memref<7xf32>
    %135 = affine.apply #map6(%c15, %c0, %c14)
    %163 = affine.min #map29(%c5, %135, %c11)
    func.call @foo(%163) : (index) -> ()
    return
  }
