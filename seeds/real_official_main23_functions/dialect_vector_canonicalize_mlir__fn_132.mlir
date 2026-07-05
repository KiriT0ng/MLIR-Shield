func.func @masked_vector_multi_reduction_no_reduction_dims_nd(%arg0: vector<2x3xf32>, %acc: vector<2x3xf32>, %mask: vector<2x3xi1>) -> vector<2x3xf32> {
    %0 = vector.mask %mask { vector.multi_reduction <add>, %arg0, %acc [] : vector<2x3xf32> to vector<2x3xf32> } : vector<2x3xi1> -> vector<2x3xf32>
    return %0 : vector<2x3xf32>
}
