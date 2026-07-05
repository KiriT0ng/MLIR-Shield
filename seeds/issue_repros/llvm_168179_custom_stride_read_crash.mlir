// Source: https://github.com/llvm/llvm-project/issues/168179
// Command from issue:
// simple-arith-opt2 test_vector.mlir -pass-pipeline="builtin.module(func.func(lower-simple-vector-stride-read,canonicalize,cse))"
module {
  func.func @test(%v: vector<8 x f32>) -> vector<4 x f32> {
    %r = simple_vector.stride_read %v offsets = [0], sizes = [4], strides = [2]
         : vector<8 x f32> -> vector<4 x f32>
    return %r : vector<4 x f32>
  }
}
