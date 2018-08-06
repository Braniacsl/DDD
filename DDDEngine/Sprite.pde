//  Benjamin Burt
//  8/6/2018

class Sprite {
  PImage img = new PImage();
  public Sprite(PImage image){
    this.img = image;
    this.img.resize(100, 100);
  }
  public void render(float x, float y){
    image(this.img, x, y);
  }
}
