static class PhysicsEngine {
  public static HashMap<String, RigidBody> SimulatePhysics(HashMap<String, Object> objects){
    for(String key : objects.keySet()){
      Object obj = objects.get(key);
      if(obj.rb.isKinematic){
        
      }
    }
  }
}
