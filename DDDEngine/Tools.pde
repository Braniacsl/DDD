static class VectorMath{
  static PVector add(PVector first, PVector second){
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
