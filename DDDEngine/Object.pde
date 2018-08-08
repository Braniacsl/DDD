// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{

  RigidBody rb;
  Sprite sp;
  PVector[] Vectors;
  String ogLocation;
  public Object(String location, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass, float bounciness, PVector[] vectors){
    this.rb = new RigidBody(isKinematic, useGravity, colliderA, colliderB, position, velocity, mass, bounciness);
    ogLocation = location;
    if(vectors == null){
      this.sp = new Sprite(loadImage(location));
    }
    else {
      this.Vectors = vectors;
    }

  }
  public Object(String location, RigidBody rb, PVector[] vectors){
    this.rb = rb;
    ogLocation = location;
    if(vectors == null){
      this.sp = new Sprite(loadImage(location));
    }
    else {
      this.Vectors = vectors;
    }
  }
  
  Object DeepCopy(){
    PVector[] copiedVectors = null;
    if(Vectors != null){
      copiedVectors = new PVector[Vectors.length]; //<>//
      arraycopy(Vectors, 0, copiedVectors, 0, Vectors.length);
    }
    return new Object(ogLocation, rb.DeepCopy(), copiedVectors);
  }
}
