// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();
Renderer renderer = new Renderer();
PhysicsEngine pe = new PhysicsEngine();

void setup(){
  //fullScreen();
  size(1000, 1000);
  background(0);


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
  
  objects.put("Enemy", new Object(null, false, true, new PVector(), new PVector(20, 20, 20), new PVector(70f, 0f, 10f), new PVector(0, 0), 5, 1, vectors));
  objects.put("Player", new Object("./Images/fiend.png", false, true, new PVector(), new PVector(20, 20, 20), new PVector(60f, 50f, 10f), new PVector(0, 0), 5, 1, null));
  objects.put("Pirate", new Object(null, true, false, new PVector(), new PVector(990, 100, 30), new PVector(20f, 700f, 10f), new PVector(0, 0), 5, 1, vectors));

}

void keyPressed(){
   RigidBody playerRB = objects.get("Player").rb;
  if(key == 'w'){
    playerRB.velocity.z += .1;
  }else if(key == 's'){
    playerRB.velocity.z -= .1;
  }else{
  objects.put(String.valueOf(random(-9999, 9999)), new Object("./Images/fiend.png", false, true, new PVector(), new PVector(20, 20, 20), new PVector(mouseX, mouseY, 10f), new PVector(0, 0), 5, 1, null));
  }
}

void draw(){
  clear();

 /* println("Player: ", objects.get("Player").rb.position);
  println("Enemy: ", objects.get("Enemy").rb.position);
  println("Pirate: ", objects.get("Pirate").rb.position);
  println("");
*/
  background(0);  
  objects = pe.SimulatePhysics(objects);
  //renderer.render(objects);
  RigidBody playerRB = objects.get("Player").rb;
  //playerRB.velocity.x += (playerRB.position.x < mouseX ? .1 : -.1);
  playerRB.position.x = mouseX;
  playerRB.position.y = mouseY;
  for(String k : objects.keySet()){
    objects.get(k).rb.RenderHitbox(k == "Player" ? color(255, 0, 0) : color(0, 255, 0)); 
  }
}
