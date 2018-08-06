//  Benjamin Burt
//  8/6/2018

class Sprite {
  PImage image;
  public Sprite(PImage image){
    this.image = image;
  }
  public void render(float x, float y, float w, float h){
    image(this.image, x, y, w, h);
  }
}
