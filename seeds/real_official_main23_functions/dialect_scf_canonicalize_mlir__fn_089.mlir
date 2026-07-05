func.func @dead_index_switch_result(%arg0 : index, %arg1 : memref<i32>) -> index {
  %non_live, %live = scf.index_switch %arg0 -> i32, index
  case 1 {
    %c10 = arith.constant 10 : i32
    memref.store %c10, %arg1[] : memref<i32>
    scf.yield %c10, %arg0 : i32, index
  }
  default {
    %c11 = arith.constant 11 : i32
    memref.store %c11, %arg1[] : memref<i32>
    scf.yield %c11, %arg0 : i32, index
  }
  return %live : index
}
