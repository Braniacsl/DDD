
class PhysicsEngine {
  static final int collisionCycles = 2;
  static final float gravity = 1;
  int cycle = 0;
  BoolVector CheckCollision(PVector aMin, PVector aMax, PVector bMin, PVector bMax) {
    //https://developer.mozilla.org/en-US/docs/Games/Techniques/3D_collision_detection
    return new BoolVector(
      (aMin.x <= bMax.x && aMax.x >= bMin.x), 
      (aMin.y <= bMax.y && aMax.y >= bMin.y), 
      (aMin.z <= bMax.z && aMax.z >= bMin.z)
      );
  }

  public HashMap<String, Object> SimulatePhysics(HashMap<String, Object> objects) {
    for (String key : objects.keySet()) {
      Object obj = objects.get(key);
      if (obj.rb.isKinematic) {
        continue;
      }
      //Gravity: https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity/16466#16466
      PVector forces = new PVector();

      if (cycle == 0) {
        if (obj.rb.useGravity)
          forces.y += gravity;

        //basically velocity +=, but with VectorMath
        obj.rb.velocity = VectorMath.add(
          obj.rb.velocity, 
          VectorMath.divide(forces, obj.rb.mass)
          );
      }
      for (String otherKey : objects.keySet()) {
        if (otherKey == key) continue;
        Object other = objects.get(otherKey);
        BoolVector res = CheckCollision(
          VectorMath.add(obj.rb.colliderA, obj.rb.position), 
          VectorMath.add(obj.rb.colliderB, obj.rb.position), 
          VectorMath.add(other.rb.colliderA, other.rb.position), 
          VectorMath.add(other.rb.colliderB, other.rb.position) 
          );
        if (res.IsOne()) {
          PVector aMax = VectorMath.add(obj.rb.colliderB, obj.rb.position);
          PVector bMin = VectorMath.add(other.rb.colliderA, other.rb.position);
          final float x = aMax.x - bMin.x;
          final float y = aMax.y - bMin.y;
          final float z = aMax.z - bMin.z;
          boolean isZ = false;
          if (x < y) {
            if (x < z) {
              // x
              
              float objVel = (obj.rb.velocity.x) * ((obj.rb.bounciness + other.rb.bounciness) / 2);
              if(other.rb.isKinematic){
                if (obj.rb.position.x < other.rb.position.x) {                                                    
                  obj.rb.velocity.x = -abs(objVel);
                } else {
                  obj.rb.velocity.x = abs(objVel);
                }
              }else{
                float otherVel = (other.rb.velocity.x) * ((obj.rb.bounciness + other.rb.bounciness) / 2);
                obj.rb.velocity.x = otherVel;
                other.rb.velocity.x = objVel;
              }
            } else {
              // z
              isZ = true;
            }
          } else {
            if (y < z) {
              // y
              float objVel = (obj.rb.velocity.y) * ((obj.rb.bounciness + other.rb.bounciness) / 2);
              if(other.rb.isKinematic){
                if (obj.rb.position.y < other.rb.position.y) {
                  obj.rb.velocity.y = -abs(objVel);
                } else {
                  obj.rb.velocity.y = abs(objVel);
                }
              }else{
                float otherVel = (other.rb.velocity.y) * ((obj.rb.bounciness + other.rb.bounciness) / 2);
                obj.rb.velocity.y = otherVel;
                other.rb.velocity.y = objVel;
              }
            } else {
              // z
              //println("Hit Z in else");
              isZ = true;
            }
          }
          if (isZ) {
            float objVel = (obj.rb.velocity.z) * ((obj.rb.bounciness + other.rb.bounciness) / 2);
              if(other.rb.isKinematic){
                if (obj.rb.position.z < other.rb.position.z) {
                  obj.rb.velocity.z = -abs(objVel);
                } else {
                  obj.rb.velocity.z = abs(objVel);
                }
              }else{
                float otherVel = (other.rb.velocity.z) * ((obj.rb.bounciness + other.rb.bounciness) / 2);
                obj.rb.velocity.z = otherVel;
                other.rb.velocity.z = objVel;
              }
          }
        }
      }

      obj.rb.position = VectorMath.add(
        obj.rb.position, 
        VectorMath.divide(obj.rb.velocity, collisionCycles) 
        );

      cycle++;
      if (cycle > collisionCycles)
        cycle = 0;
    }
    return objects;
  }
}
