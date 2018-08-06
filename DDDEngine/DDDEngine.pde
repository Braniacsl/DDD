// MAIN FILE
// ANY GAME CODE SHOULD GO HERE

HashMap<String, Object> objects = new HashMap<String, Object>();

void setup(){
  fullScreen();
  background(0);
  objects.put("Player", new Object("100, 54, 65, 100, 23, 12, 56, 122, 528, 251, 123, 131, 312, 212, 234, 121, 641, 213, 211, 152, 215, 185, 144, 154", false, true, new PVector(40, 40), new PVector(50, 50), new PVector(200f, 200f), new PVector(0, 0), 5f));
}

void draw(){
  Renderer.render(objects);
}
