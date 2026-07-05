func.func @create_mask_1d(%num_elems : index) -> vector<4xi1> {
  %v = vector.create_mask %num_elems : vector<4xi1>
  return %v: vector<4xi1>
}
