HashMap<String, Object> objects = new HashMap<String, Object>();

HashMap<String, Object> scene0 = new HashMap<String, Object>();

HashMap<String, Object> scene1 = new HashMap<String, Object>();

HashMap<String, Object> scene2 = new HashMap<String, Object>();

Scene[] scenes;
SceneManager sm;

Renderer renderer = new Renderer();
PhysicsEngine pe = new PhysicsEngine();

void setup(){
  //fullScreen();
  size(1200, 700);
  background(255);
  
  scene1.put("Enemy", new Object("", false, true , true, new PVector(0, 0, 0), new PVector(200, 200, 200), new PVector(width/2, 200f, 50f), new PVector(0, 0), 5, 0.8));
  
  scene1.put("Player", new Object("./Images/fiend.png", true, true, true, new PVector(0, 0, 0), new PVector(200, 200, 10), new PVector(width/2, 200f, 1f), new PVector(0, 0), 5, 0.8));
  
  scene0.put("Enemy", new Object("", false, false, true, new PVector(), new PVector(20, 20, 20), new PVector(70f, 0f, 10f), new PVector(0, 0), 5, .8));
  scene0.put("Player", new Object("./Images/fiend.png", false, false, false, new PVector(), new PVector(20, 20, 20), new PVector(60f, 50f, 10f), new PVector(0, 0), 5, .8));
  scene0.put("Pirate", new Object("", true, true, false, new PVector(), new PVector(990, 100, 30), new PVector(20f, 700f, 10f), new PVector(0, 0), 5, .8));

  scene2.put("wallA", new Object("", true, true, false, new PVector(), new PVector(20, 20, 20), new PVector(20, 300, 10), new PVector(0, 0), 5, 1));
  scene2.put("wallB", new Object("", true, true, false, new PVector(), new PVector(20, 20, 20), new PVector(1000, 300, 10), new PVector(0, 0), 5, 1));
  scene2.put("ball1", new Object("", true, false, false, new PVector(), new PVector(20, 20, 20), new PVector(300, 300, 10), new PVector(10, 0), 5, 1));
  scene2.put("ball2", new Object("", true, false, false, new PVector(), new PVector(20, 20, 20), new PVector(400, 300, 10), new PVector(0, 0), 5, 1));
  scene2.put("ball3", new Object("", true, false, false, new PVector(), new PVector(20, 20, 20), new PVector(500, 300, 10), new PVector(0, 0), 5, 1));
  scene2.put("ball4", new Object("", true, false, false, new PVector(), new PVector(20, 20, 20), new PVector(600, 300, 10), new PVector(0, 0), 5, 1));
  scene2.put("ball5", new Object("", true, false, false, new PVector(), new PVector(20, 20, 20), new PVector(700, 300, 10), new PVector(0, 0), 5, 1));
  
  scenes = new Scene[]{
    new Scene(scene0),
    new Scene(scene1),
    new Scene(scene2)
  };
  sm = new SceneManager(scenes);
  
  }

void keyPressed(){
  Scene s = sm.switchSceneWithKey(key);
  if(s != null){
    objects = s.objects;
  }
  
  if(sm.loadedScene == 0 && key == 'q'){
    objects.put(String.valueOf(random(0, 10000)), new Object("", false, false, true, new PVector(), new PVector(20, 20, 20), new PVector(mouseX, mouseY, 10), new PVector(0, 0), 5, .8));
  }
  if(sm.loadedScene == 0 && key == 'w'){
    objects.put(String.valueOf(random(0, 10000)), new Object("", false, false, false, new PVector(), new PVector(20, 20, 20), new PVector(mouseX, mouseY, 10f), new PVector(0, 0), 5, .8));
  }
}

void draw(){
  clear();
  background(255);  
  noFill();
  objects = pe.SimulatePhysics(objects);

  if(sm.loadedScene == 1)
    renderer.render(objects);
  
  if(sm.loadedScene == 0){
    RigidBody playerRB = objects.get("Player").rb;
    playerRB.velocity.x += (playerRB.position.x < mouseX ? .05 : -.05);
    playerRB.velocity.y += (playerRB.position.y < mouseY ? .05 : -.05);
  }
  if(sm.loadedScene == 0 || sm.loadedScene == 2){
      for(String k : objects.keySet()){
      objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : color(0, 255, 0)); 
    }
  }
}
