class VectorMath{
  PVector add(PVector first, PVector second){
    return new PVector(first.x + second.x, first.y + second.y, first.z + second.z);
  }
  PVector multiply(PVector first, PVector second){
    return new PVector(first.x * second.x, first.y * second.y, first.z * second.z);
  }
  PVector subtract(PVector first, PVector second){
    return new PVector(first.x - second.x, first.y - second.y, first.z - second.z);
  }
  PVector divide(PVector first, PVector second){
    return new PVector(first.x / second.x, first.y / second.y, first.z / second.z);
  }
}
