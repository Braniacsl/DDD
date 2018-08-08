// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();
Renderer renderer = new Renderer();

void setup(){
  //fullScreen();
  fullScreen();
  background(255);
  frameRate(60);

  //objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(50, 50), new PVector(100, 100, 100), new PVector(20f, 20f, 1f), new PVector(0, 0), 5, null));
  
  objects.put("Enemy", new Object("", false, true , true, new PVector(0, 0, 0), new PVector(200, 200, 200), new PVector(width/2, 200f, 50f), new PVector(0, 0), 5));
  
  objects.put("Player", new Object("./Images/fiend.png", true, true, true, new PVector(0, 0, 0), new PVector(200, 200, 10), new PVector(width/2, 200f, 1f), new PVector(0, 0), 5));
  //objects.put("Floorkoblin", new Object("./Images/fiend.png", true, false, new PVector(), new PVector(100, 100, 100), new PVector(200f, 500f), new PVector(0, 0), 5, null));
}

void draw(){
  clear();
  background(255);  
  noFill();
  objects = PhysicsEngine.SimulatePhysics(objects);
  renderer.render(objects);
  //for(String k : objects.keySet())
    //objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : color(0, 255, 0)); 
}
