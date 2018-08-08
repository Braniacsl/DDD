// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{

  RigidBody rb;
  Sprite sp=null;
  PVector[] Vectors;
  boolean takesRotation;
  PVector rotation;
  String ogLocation;
  public Object(String location, boolean takesRotation, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass, float bounce){
    this.rb = new RigidBody(isKinematic, useGravity, colliderA, colliderB, position, velocity, mass, bounce);
    ogLocation = location;
    if(location.contains(".png")){
      this.sp = new Sprite(loadImage(location));
    }
    this.takesRotation = takesRotation;
    if(takesRotation){
      rotation = new PVector(0, 0);
    }
    
  }
  public Object(String location, boolean takesRotation, RigidBody rb, PVector[] vectors){
    this.rb = rb;
    ogLocation = location;
    if(location.contains(".png")){
      this.sp = new Sprite(loadImage(location));
    }
    this.takesRotation = takesRotation;
    if(takesRotation){
      rotation = new PVector(0, 0);
    }
  }
  
  Object DeepCopy(){
    PVector[] copiedVectors = null;
    if(Vectors != null){
      copiedVectors = new PVector[Vectors.length]; //<>//
      arraycopy(Vectors, 0, copiedVectors, 0, Vectors.length);
    } //<>//
    return new Object(ogLocation, takesRotation, rb.DeepCopy(), copiedVectors);
  }
}
