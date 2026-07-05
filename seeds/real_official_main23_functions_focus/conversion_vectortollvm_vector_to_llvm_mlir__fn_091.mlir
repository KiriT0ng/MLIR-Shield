func.func @create_mask_0d(%num_elems : index) -> vector<i1> {
  %v = vector.create_mask %num_elems : vector<i1>
  return %v: vector<i1>
}
