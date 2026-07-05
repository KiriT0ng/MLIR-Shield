func.func @canonicalize_broadcast_shapecast_scalar(%arg0: f32) -> vector<1xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<1x1x1xf32>
    %1 = vector.shape_cast %0 : vector<1x1x1xf32> to vector<1xf32>
    return %1 : vector<1xf32>
}
