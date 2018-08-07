static class PhysicsEngine {
  static final float gravity = 1;
  
  static BoolVector CheckCollision(PVector aMin, PVector aMax, PVector bMin, PVector bMax){
    //https://developer.mozilla.org/en-US/docs/Games/Techniques/3D_collision_detection
    return new BoolVector(
      (aMin.x <= bMax.x && aMax.x >= bMin.x),
      (aMin.y <= bMax.y && aMax.y >= bMin.y),
      (aMin.z <= bMax.z && aMax.z >= bMin.z)
    );
  }
  
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
    
    for(String otherKey : objects.keySet()){
      if(otherKey == key) continue;
      Object other = objects.get(otherKey);
      BoolVector res = CheckCollision(
        VectorMath.add(obj.rb.colliderA, obj.rb.position),
        VectorMath.add(obj.rb.colliderB, obj.rb.position),
        VectorMath.add(other.rb.colliderA, other.rb.position),
        VectorMath.add(other.rb.colliderB, other.rb.position) 
      );
      if(res.IsOne()) obj.rb.velocity = new PVector();
    }
    
    obj.rb.position = VectorMath.add(
      obj.rb.position,
      obj.rb.velocity
    );
  
    }
    return objects;
  }
}
