func.func @vector_multi_reduction_unit_dimensions_fail(%source: vector<5x1x4x1x20xf32>, %acc: vector<5x1x20xf32>) -> vector<5x1x20xf32> {
    %0 = vector.multi_reduction <mul>, %source, %acc [1, 2] : vector<5x1x4x1x20xf32> to vector<5x1x20xf32>

    return %0 : vector<5x1x20xf32>
}
