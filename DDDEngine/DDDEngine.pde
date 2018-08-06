// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();

void setup(){
  fullScreen();
  background(0);
  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(40, 40, 40), new PVector(100, 100, 100), new PVector(200f, 200f), new PVector(0, 0), 5));
}

void draw(){
  clear();
  background(0);
  objects = PhysicsEngine.SimulatePhysics(objects);
  Renderer.render(objects);
}
