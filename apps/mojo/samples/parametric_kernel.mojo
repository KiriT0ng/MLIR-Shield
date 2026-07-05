fn scale_add[size: Int](x: Int, y: Int) -> Int:
    return x * size + y

fn main():
    let value = scale_add[4](3, 7)
    print(value)
