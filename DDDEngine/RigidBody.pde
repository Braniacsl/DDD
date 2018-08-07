class RigidBody {
  boolean isKinematic;
  boolean useGravity;
  PVector colliderA; //colliderA and colliderB are RELATIVE to position. They are two points of the collider rectangle
  PVector colliderB;
  PVector position;
  PVector velocity;
  PVector dimensions;
  float mass;
  float bounciness;
  RigidBody(boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass, float bounciness){
      this.isKinematic = isKinematic;
      this.useGravity = useGravity;
      this.colliderA = colliderA;
      this.colliderB = colliderB;
      this.position = position;
      this.velocity = velocity;
      this.mass = mass;
      this.dimensions = VectorMath.subtract(colliderA, colliderB);
      this.bounciness = bounciness;
  }
  
  void RenderHitbox(color c){
    fill(c);
    rect(colliderA.x + position.x - dimensions.x, colliderA.y + position.y - dimensions.y, dimensions.x, dimensions.y);
  }
}
