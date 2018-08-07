HashMap<String, Object> objects = new HashMap<String, Object>();
Renderer renderer = new Renderer();
PhysicsEngine pe = new PhysicsEngine();

void setup(){
  fullScreen();
  //size(1000, 1000);


  PVector[] vectors = new PVector[24];
  vectors[0] = new PVector(1, 1, 1);
  vectors[1] = new PVector(2,1, 1);
  vectors[2] = new PVector(2, 2, 1);
  vectors[3] = new PVector(1, 2, 1);
  
  vectors[4] = new PVector(1, 1, 1);
  vectors[5] = new PVector(2, 1, 1);
  vectors[6] = new PVector(1, 1, 1.5);
  vectors[7] = new PVector(2,1, 1.5);
  
  vectors[8] = new PVector(1, 2, 1);
  vectors[9] = new PVector(2, 2, 1);
  vectors[10] = new PVector(1, 2, 1.5);
  vectors[11] = new PVector(2, 2, 1.5);
  
  vectors[12] = new PVector(1, 1, 1);
  vectors[13] = new PVector(1, 2, 1);
  vectors[14] = new PVector(1, 1, 1.5);
  vectors[15] = new PVector(1, 2, 1.5);
  
  vectors[16] = new PVector(2, 1, 1);
  vectors[17] = new PVector(2, 2, 1);
  vectors[18] = new PVector(2, 1, 1.5);
  vectors[19] = new PVector(2, 2, 1.5);
  
  vectors[20] = new PVector(1, 1, 1.5); 
  vectors[21] = new PVector(2, 1, 1.5);
  vectors[22] = new PVector(2, 2, 1.5);
  vectors[23] = new PVector(1, 2, 1.5);
  
  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(20, 20, 20), new PVector(60f, 50f, 10f), new PVector(0, 0), 5, 1, null));
}

void draw(){
  clear();
  background(0); 
  
  objects = pe.SimulatePhysics(objects);
  renderer.render(objects);
}
