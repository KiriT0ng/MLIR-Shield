func.func @cond_prop_else(%arg0 : i1) {
  scf.if %arg0 {
  } else {
    "test.use"(%arg0) : (i1) -> ()
  }
  return
}
