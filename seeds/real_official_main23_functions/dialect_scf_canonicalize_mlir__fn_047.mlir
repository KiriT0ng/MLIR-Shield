func.func @while_move_if_down() -> i32 {
  %defined_outside = "test.get_some_value0" () : () -> (i32)
  %0 = scf.while () : () -> (i32) {
    %used_value = "test.get_some_value1" () : () -> (i32)
    %used_by_subregion = "test.get_some_value2" () : () -> (i32)
    %else_value = "test.get_some_value3" () : () -> (i32)
    %condition = "test.condition"() : () -> i1
    %res = scf.if %condition -> (i32) {
      "test.use0" (%defined_outside) : (i32) -> ()
      "test.use1" (%used_value) : (i32) -> ()
      test.alloca_scope_region {
        "test.use2" (%used_by_subregion) : (i32) -> ()
      }
      %then_value = "test.get_some_value4" () : () -> (i32)
      scf.yield %then_value : i32
    } else {
      scf.yield %else_value : i32
    }
    scf.condition(%condition) %res : i32
  } do {
  ^bb0(%res_arg: i32):
    "test.use3" (%res_arg) : (i32) -> ()
    scf.yield
  }
  return %0 : i32
}
