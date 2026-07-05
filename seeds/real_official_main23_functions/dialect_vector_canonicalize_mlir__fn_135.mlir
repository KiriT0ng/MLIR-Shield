func.func @vector_multi_reduction_unit_dimensions_single_elem(%source: vector<1x1x1xf32>, %acc: f32) -> f32 {
    %0 = vector.multi_reduction <mul>, %source, %acc [0,1,2] : vector<1x1x1xf32> to f32

    return %0 : f32
}
