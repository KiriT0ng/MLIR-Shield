func.func @pass_through(%arg0: () -> ()) -> (() -> ()) {
  cf.br ^bb1(%arg0 : () -> ())

^bb1(%bbarg: () -> ()):
  return %bbarg : () -> ()
}
