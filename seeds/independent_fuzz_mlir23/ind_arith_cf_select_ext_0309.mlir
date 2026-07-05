func.func @ind_arith_cf_select_ext_309(%cond: i1, %x: i8, %y: i8) -> i64 {
  %sel = arith.select %cond, %x, %y : i8
  %ext = arith.extui %sel : i8 to i64
  cf.cond_br %cond, ^bb1(%ext : i64), ^bb2(%ext : i64)
^bb1(%a: i64):
  return %a : i64
^bb2(%b: i64):
  return %b : i64
}
