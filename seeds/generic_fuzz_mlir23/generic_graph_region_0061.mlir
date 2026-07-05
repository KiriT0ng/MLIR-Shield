module {
  "orig.graph"() ({
    %0 = "orig.source"() : () -> i32
    %1 = "orig.mix"(%0) : (i32) -> i32
    "orig.sink"(%1) : (i32) -> ()
  }) {region_kind = "graph"} : () -> ()
}
