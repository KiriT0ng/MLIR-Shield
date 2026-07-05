func.func @dim_out_of_bounds() -> vector<7xi32> {
    %c1 = arith.constant 1 : index
    %idx28 = index.constant 28
    %c29 = arith.constant 29 : index
    %3 = bufferization.alloc_tensor(%c29) : tensor<?xi16>
    %dim = tensor.dim %3, %idx28 : tensor<?xi16>
    %alloc_21 = memref.alloc(%c29) : memref<?x26x2xi32>
    %16 = affine.vector_load %alloc_21[%c1, %c1, %dim] : memref<?x26x2xi32>, vector<7xi32>
    return %16 : vector<7xi32>
}
