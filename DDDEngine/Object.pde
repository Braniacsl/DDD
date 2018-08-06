// Benjamin Burt  
// 8/6/2018
// MIT LICENSE
//

class Object{
  RigidBody rb = new RigidBody();
  Sprite sp = new Sprite(null);
  public Object(String location){
    this.sp = new Sprite(loadImage(location));
  }
}
