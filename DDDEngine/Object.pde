// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{
  RigidBody rb;
  Sprite sp;
  float[] Vectors;
  public Object(String location, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity){
    this.rb = new RigidBody(isKinematic, useGravity, colliderA, colliderB, position, velocity);
    if(location != null){
      this.sp = new Sprite(loadImage(location));
    }
    else {
      Vectors = split(location, ",");
    }
  }
}
