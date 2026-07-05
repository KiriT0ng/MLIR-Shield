func.func @for_yields_3(%lb : index, %ub : index, %step : index) -> (i32, i32, i32) {
  %a = call @make_i32() : () -> (i32)
  %b = call @make_i32() : () -> (i32)
  %r:3 = scf.for %i = %lb to %ub step %step iter_args(%0 = %a, %1 = %a, %2 = %b) -> (i32, i32, i32) {
    %c = func.call @make_i32() : () -> (i32)
    scf.yield %0, %c, %2 : i32, i32, i32
  } {some_attr}
  return %r#0, %r#1, %r#2 : i32, i32, i32
}
