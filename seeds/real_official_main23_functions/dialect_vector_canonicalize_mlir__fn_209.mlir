func.func @empty_vector_mask(%mask : vector<8xi1>) {
  vector.mask %mask { } : vector<8xi1>
  return
}
