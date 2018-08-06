static class VectorMath{
  static PVector add(PVector first, PVector second){
    return new PVector(first.x + second.x, first.y + second.y, first.z + second.z);
  }
  static PVector multiply(PVector first, PVector second){
    return new PVector(first.x * second.x, first.y * second.y, first.z * second.z);
  }
  static PVector subtract(PVector first, PVector second){
    return new PVector(first.x - second.x, first.y - second.y, first.z - second.z);
  }
  static PVector divide(PVector first, PVector second){
    return new PVector(first.x / second.x, first.y / second.y, first.z / second.z);
  }
  
  static PVector add(PVector first, float second){
    return new PVector(first.x + second, first.y + second, first.z + second);
  }
  static PVector multiply(PVector first, float second){
    return new PVector(first.x * second, first.y * second, first.z * second);
  }
  static PVector subtract(PVector first, float second){
    return new PVector(first.x - second, first.y - second, first.z - second);
  }
  static PVector divide(PVector first, float second){
    return new PVector(first.x / second, first.y / second, first.z / second);
  }
}

static class BoolVector{
  boolean x;
  boolean y;
  boolean z;
  BoolVector(){
    this.x = false;
    this.y = false;
    this.z = false;
  }
  BoolVector(boolean x, boolean y, boolean z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  boolean IsZero(){
    return !(x || y || z);
  }
}
