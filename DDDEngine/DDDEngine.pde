// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();

void setup(){
  fullScreen();
  background(0);

  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(100, 100, 100), new PVector(200f, 200f), new PVector(0, 0), 5));
  objects.put("Floorkoblin", new Object("./Images/fiend.png", true, false, new PVector(100, 100, 100), new PVector(), new PVector(200f, 500f), new PVector(0, 0), 5));


}

void draw(){
  clear();
  background(0);
  objects = PhysicsEngine.SimulatePhysics(objects);
  Renderer.render(objects);
  for(String k : objects.keySet())
    objects.get(k).rb.RenderHitbox(color(0, 255, 0));
}
