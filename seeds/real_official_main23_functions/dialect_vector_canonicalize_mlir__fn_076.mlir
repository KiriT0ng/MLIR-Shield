func.func @dont_fold_expand_collapse(%arg0: vector<1x1x64xf32>) -> vector<8x8xf32> {
    %0 = vector.shape_cast %arg0 : vector<1x1x64xf32> to vector<1x1x8x8xf32>
    %1 = vector.shape_cast %0 : vector<1x1x8x8xf32> to vector<8x8xf32>
    return %1 : vector<8x8xf32>
}
