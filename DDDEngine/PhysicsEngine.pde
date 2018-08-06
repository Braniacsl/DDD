static class PhysicsEngine {
  static final float gravity = 9.81 % 2;
  
  public static HashMap<String, Object> SimulatePhysics(HashMap<String, Object> objects){
    for(String key : objects.keySet()){
      Object obj = objects.get(key);
      if(obj.rb.isKinematic){
        continue;
      }
      //Gravity: https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity/16466#16466
      PVector forces = new PVector();
      
      if(obj.rb.useGravity)
        forces.y += gravity;
      
      //basically velocity +=, but with VectorMath
      obj.rb.velocity = VectorMath.add(
        obj.rb.velocity,
        VectorMath.divide(forces, obj.rb.mass)
      );
      obj.rb.position = VectorMath.add(
        obj.rb.position,
        obj.rb.velocity
      );
    }
    return objects;
  }
}
