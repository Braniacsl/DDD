static class PhysicsEngine {
  static final float gravity = -9.81;
  
  public static HashMap<String, RigidBody> SimulatePhysics(HashMap<String, Object> objects){
    for(String key : objects.keySet()){
      Object obj = objects.get(key);
      if(obj.rb.isKinematic){
        continue;
      }
      //Gravity: https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity/16466#16466
      PVector forces = new PVector();
      forces.y += gravity;
      obj.rb.velocity += ;
      
    }
  }
}
