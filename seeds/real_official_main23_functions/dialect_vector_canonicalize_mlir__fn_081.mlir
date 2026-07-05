func.func @canonicalize_broadcast_shapecast_to_broadcast(%arg0: vector<3xf32>) -> vector<8x3xf32> {
    %0 = vector.broadcast %arg0 : vector<3xf32> to vector<2x4x3xf32>
    %1 = vector.shape_cast %0 : vector<2x4x3xf32> to vector<8x3xf32>
    return %1 : vector<8x3xf32>
}
