HashMap<String, Object> objects = new HashMap<String, Object>();

HashMap<String, Object> scene0 = new HashMap<String, Object>();

HashMap<String, Object> scene1 = new HashMap<String, Object>();


Scene[] scenes;
SceneManager sm;

Renderer renderer = new Renderer();
PhysicsEngine pe = new PhysicsEngine();

void setup(){
  //fullScreen();
  size(1000, 1000);
  background(255);
  
  scene1.put("Enemy", new Object("", false, true , true, new PVector(0, 0, 0), new PVector(200, 200, 200), new PVector(width/2, 200f, 50f), new PVector(0, 0), 5, 0.8));
  
  scene1.put("Player", new Object("./Images/fiend.png", true, true, true, new PVector(0, 0, 0), new PVector(200, 200, 10), new PVector(width/2, 200f, 1f), new PVector(0, 0), 5, 0.8));
  
  scene0.put("Enemy", new Object("", false, true, true, new PVector(), new PVector(20, 20, 20), new PVector(70f, 0f, 10f), new PVector(0, 0), 5, .8));
  scene0.put("Player", new Object("./Images/fiend.png", false, true, true, new PVector(), new PVector(20, 20, 20), new PVector(60f, 50f, 10f), new PVector(0, 0), 5, .8));
  scene0.put("Pirate", new Object("", true, false, true, new PVector(), new PVector(990, 100, 30), new PVector(20f, 700f, 10f), new PVector(0, 0), 5, .8));
  
  scenes = new Scene[]{
    new Scene(scene0),
    new Scene(scene1)
  };
  sm = new SceneManager(scenes);
  
  }

void keyPressed(){
  Scene s = sm.switchSceneWithKey(key);
  if(s != null){
    objects = s.objects;
  }
}

void draw(){
  clear();
  background(255);  
  noFill();
  objects = pe.SimulatePhysics(objects);
  renderer.render(objects);
  
  /*
  for(String k : objects.keySet()){
    objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : color(0, 255, 0)); 
  }
  */
}
