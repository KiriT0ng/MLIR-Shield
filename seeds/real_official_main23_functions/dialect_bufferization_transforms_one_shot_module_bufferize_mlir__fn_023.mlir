func.func @entry(%A : tensor<?xf32> {bufferization.buffer_layout = affine_map<(i)[s0, s1] -> (i)>, bufferization.writable = false},
