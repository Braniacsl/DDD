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
  boolean IsOne(){
    return (x && y && z);
  }
  public String toString(){
    return "(" + Boolean.toString(x) + ", " + Boolean.toString(y) + ", " + Boolean.toString(z) + ")";
  }
}

static class GenericFunctions{
   //Splits a sentence into a float array 
   static PVector[] split(String str, char stf){
    String[] med = str.split("" + stf);
    PVector[] res = new PVector[med.length];
    int count = 0;
    int arcount = 0;
    PVector temp = new PVector();
    for(int i = 0; i < med.length; i++){
      if(count == 0){
        temp.x = Float.parseFloat(med[i]);
        count++;
      }
      else if(count == 1){
        temp.y = Float.parseFloat(med[i]);
        count++;
      }
      else if(count == 2){
        temp.z = Float.parseFloat(med[i]);
        count++;
      }
      else if(count == 3){
        count = 0;
        res[arcount] = temp;
        temp = new PVector();
        arcount = 0;
      }
    }
    return res;
  }
}  
