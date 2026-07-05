func.func @masked_vector_multi_reduction_single_parallel(%arg0: vector<2xf32>, %acc: vector<2xf32>, %mask: vector<2xi1>) -> vector<2xf32> {
    %0 = vector.mask %mask { vector.multi_reduction <mul>, %arg0, %acc [] : vector<2xf32> to vector<2xf32> } : vector<2xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
}
