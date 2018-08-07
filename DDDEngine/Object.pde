// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{

  RigidBody rb;
  Sprite sp;
  PVector[] Vectors;
  public Object(String location, boolean takesRotation, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass){
    this.rb = new RigidBody(isKinematic, useGravity, colliderA, colliderB, position, velocity, mass);
    if(location.contains(".png") != false){
      this.sp = new Sprite(loadImage(location));
    }
  }
}
