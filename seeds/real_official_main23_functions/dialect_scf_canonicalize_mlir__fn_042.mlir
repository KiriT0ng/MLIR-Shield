func.func @cond_prop_then(%arg0 : i1) {
  scf.if %arg0 {
    "test.use"(%arg0) : (i1) -> ()
  }
  return
}
