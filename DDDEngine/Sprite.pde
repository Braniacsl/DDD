//  Benjamin Burt
//  8/6/2018

class Sprite {
  PImage img = new PImage();
  public Sprite(PImage image){
    this.img = image;
  }
  public void render(float x, float y, float w, float h){
    image(this.img, x, y, w, h);
  }
}
