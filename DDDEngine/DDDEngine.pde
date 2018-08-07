// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();

void setup(){
  //fullScreen();
  size(1000, 1000);
  background(0);

  objects.put("Lol", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(100, 100, 100), new PVector(600f, 50f, 50), new PVector(0, 0), 10));

  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(100, 100, 100), new PVector(200f, 200f, 0), new PVector(0, 0), 5));
  objects.put("Floorkoblin", new Object("./Images/fiend.png", true, false, new PVector(), new PVector(300, 100, 100), new PVector(400f, 700f, 0), new PVector(0, 0), 5));
  

}

void draw(){
  clear();
  background(0);
  objects = PhysicsEngine.SimulatePhysics(objects);
  Renderer.render(objects);
  for(String k : objects.keySet())
    objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : color(0, 255, 0));
  println(mouseX, mouseY);
}
