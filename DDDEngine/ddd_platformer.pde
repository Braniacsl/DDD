class Platformer {
  HashMap<String, Object> scene3 = new HashMap<String, Object>();
  Object player;
  float cur_x;
  int ticks = 0;
  HashMap start(){
    player = new Object("./Images/idle.png", false, false , true, new PVector(0, 0, 0), new PVector(50, 50, 50), new PVector(100, 0, 0), new PVector(0, 0), 5, 0);
    scene3.put("boi", player);
    cur_x = player.rb.position.x;
    int floors = (int) random(10, 20);
    PVector within_v = new PVector(100, 100);
    Object prev_obj = new Object("./Images/Floor.png", false, true, false, new PVector(0, 0, 0), new PVector(0, 0, 0), new PVector(0, 0, 0), new PVector(0, 0), 5, 0);
    for(int i = 0; i < floors; i++){
      float w = random(50, 300);
      float h = random(20, 50);
      float z = random(300, 500);
      float x = random(200, 300);
      float y = random(50, 500);
      float z1 = random(-50, 50);
      Object floor = new Object("./Images/Floor.png", false, true, false, new PVector(0, 0, 0), new PVector(w, h, z), new PVector(prev_obj.rb.position.x + x, prev_obj.rb.position.y + y, 0), new PVector(0, 0), 5, 0);
      Object enemy = new Object("./Images/Enemy.png", false, true, false, new PVector(0, 0, 0), new PVector(50, 50, 0), new PVector(prev_obj.rb.position.x  + x + (int) random(10, 50), prev_obj.rb.position.y +  y - (int) random(50, 200), z1), new PVector(0, 0), 5, 0);
      prev_obj = floor;
      scene3.put("floor" + i, floor);
      scene3.put("enemy" + i, enemy);
    }
    return scene3;
  }
  
  void update(){
    if(ticks > 30){
      if(player.rb.position.x != cur_x){
        if(player.ogLocation == "./Images/Player.png"){
          player.sp = new Sprite(loadImage("./Images/run1.png"));
          player.ogLocation = "./Images/run1.png";
        }
        else if(player.ogLocation == "./Images/run1.png"){
          player.sp = new Sprite(loadImage("./Images/run2.png"));
          player.ogLocation = "./Images/run2.png";
        }
        else {
          player.sp = new Sprite(loadImage("./Images/run1.png"));
          player.ogLocation =  "./Images/run1.png";
        }
      cur_x = player.rb.position.x;
      }
      else {
        player.sp = new Sprite(loadImage("./Images/idle.png"));
      }
      ticks = 0;
    }
    ticks++;
  }
  
  void input(float x, float y, float z){
    this.player.rb.position.x += x * 3;
    this.player.rb.velocity.y -= y * 3;
    this.player.rb.dimensions.x += z * 3;
    this.player.rb.dimensions.y += z * 3;
  }
}
