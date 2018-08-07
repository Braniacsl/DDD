// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{

  RigidBody rb;
  Sprite sp;
  PVector[] Vectors;
  public Object(String location, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass, float bounciness, PVector[] vectors){
    this.rb = new RigidBody(isKinematic, useGravity, colliderA, colliderB, position, velocity, mass, bounciness);
    if(vectors == null){
      this.sp = new Sprite(loadImage(location));
    }
    else {
      this.Vectors = vectors;
    }

  }
}
