// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();
Renderer renderer = new Renderer();

void setup(){
  fullScreen();
  background(0);


  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(50, 50), new PVector(100, 100, 100), new PVector(20f, 20f, 1f), new PVector(0, 0), 5, null));
  PVector[] vectors = new PVector[24];
  vectors[0] = new PVector(20, 20, 20f);
  vectors[1] = new PVector(30, 20, 20f);
  vectors[2] = new PVector(30, 30, 20f);
  vectors[3] = new PVector(20, 30, 20f);
  
  vectors[4] = new PVector(20, 20, 20f);
  vectors[5] = new PVector(30, 20, 20f);
  vectors[6] = new PVector(20, 20, 25f);
  vectors[7] = new PVector(30, 20, 25f);
  
  vectors[8] = new PVector(20, 30, 20f);
  vectors[9] = new PVector(30, 30, 20f);
  vectors[10] = new PVector(20, 30, 25f);
  vectors[11] = new PVector(30, 30, 25f);
  
  vectors[12] = new PVector(20, 20, 20f);
  vectors[13] = new PVector(20, 30, 20f);
  vectors[14] = new PVector(20, 20, 25f);
  vectors[15] = new PVector(20, 30, 25f);
  
  vectors[16] = new PVector(30, 20, 20f);
  vectors[17] = new PVector(30, 30, 20f);
  vectors[18] = new PVector(30, 20, 25f);
  vectors[19] = new PVector(30, 30, 25f);
  
  vectors[20] = new PVector(20, 20, 25f); 
  vectors[21] = new PVector(30, 20, 25f);
  vectors[22] = new PVector(30, 30, 25f);
  vectors[23] = new PVector(20, 30, 25f);
  objects.put("Enemy", new Object(null, false, true, new PVector(50, 50), new PVector(100, 100, 100), new PVector(200f, 200f), new PVector(0, 0), 5, vectors));

  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(100, 100, 100), new PVector(200f, 200f, 1f), new PVector(0, 0), 5, null));
  //objects.put("Floorkoblin", new Object("./Images/fiend.png", true, false, new PVector(), new PVector(100, 100, 100), new PVector(200f, 500f), new PVector(0, 0), 5, null));

}

void draw(){
  clear();
  background(0);
  //objects = PhysicsEngine.SimulatePhysics(objects);
  renderer.render(objects);
}
