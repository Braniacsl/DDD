// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{
  RigidBody rb = null;
  Sprite sp = new Sprite(null);
  public Object(String location, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity){
    this.rb = new RigidBody(isKinematic, useGravity, colliderA, colliderB, position, velocity);
    this.sp = new Sprite(loadImage(location));
  }
}
