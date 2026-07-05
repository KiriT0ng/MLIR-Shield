func.func @nested_while_ops(%arg0: f32) -> i64 {
  %0 = scf.while(%outer = %arg0) : (f32) -> i64 {
    %cond = "test.outer_before_pre"() : () -> i1
    %1 = scf.while(%inner = %outer) : (f32) -> i64 {
      %2:2 = "test.inner_before"(%inner) : (f32) -> (i1, i64)
      scf.condition(%2#0) %2#1 : i64
    } do {
    ^bb0(%arg1: i64):
      %3 = "test.inner_after"(%arg1) : (i64) -> f32
      scf.yield %3 : f32
    }
    "test.outer_before_post"() : () -> ()
    scf.condition(%cond) %1 : i64
  } do {
  ^bb2(%arg2: i64):
    "test.outer_after_pre"(%arg2) : (i64) -> ()
    %4 = scf.while(%inner = %arg2) : (i64) -> f32 {
      %5:2 = "test.inner2_before"(%inner) : (i64) -> (i1, f32)
      scf.condition(%5#0) %5#1 : f32
    } do {
    ^bb3(%arg3: f32):
      %6 = "test.inner2_after"(%arg3) : (f32) -> i64
      scf.yield %6 : i64
    }
    "test.outer_after_post"() : () -> ()
    scf.yield %4 : f32
  }
  return %0 : i64
}
